package freechips.rocketchip.uintr

import Chisel._
import freechips.rocketchip.tile._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.rocket._

class UIPI(opcodes: OpcodeSet)(implicit p: Parameters) extends LazyRoCC(opcodes) {
  override lazy val module = new UIPIImp(this)
}

class UIPIImp(outer: UIPI)(implicit p: Parameters) extends LazyRoCCModuleImp(outer)
  with HasCoreParameters
  with HasTileParameters {
  import UINTCConsts._
  import UintrConsts._

  // User-Interrupt Control/Status Registers
  val uintr = io.uintr
  val uist_addr = RegInit(0.U(coreMaxAddrBits.W))
  val uintc_addr = RegInit(0.U(coreMaxAddrBits.W))
  val uintc_data = RegInit(0.U(coreDataBits.W))

  // Effects of an instruction with wrong opcode are unpredictable!
  val funct = io.cmd.bits.inst.funct
  val send = funct === 0.U
  val read = funct === 1.U
  val write = funct === 2.U
  val activate = funct === 3.U
  val deactivate = funct === 4.U

  def opAddr(index: UInt) = base.asUInt | (index << log2Ceil(opBytes)).asUInt

  /** UIPI states */
  val s_idle :: s_wait_mem0 :: s_read_uist :: s_wait_mem1 :: s_check_nack0 :: s_check_nack1 :: s_resp :: Nil = Enum(7)
  val state = RegInit(s_idle)
  val read_uist = state === s_wait_mem0
  val busy = state =/= s_idle
  val read_valid = RegInit(false.B) // keep read funct in register

  // Control
  io.busy := busy // io.cmd will be held
  io.interrupt := false.B
  io.cmd.ready := !busy
  io.mem.req.valid := busy && (state === s_wait_mem0 || state === s_wait_mem1)
  io.mem.req.bits.phys := true.B // physical address only
  // Keep the address while waiting reponse from D$
  io.mem.req.bits.addr := Mux(read_uist, uist_addr, uintc_addr)
  io.mem.req.bits.cmd := Mux(read_valid || read_uist, M_XRD, M_XWR)
  io.mem.req.bits.size := log2Ceil(8).U // 8 bytes
  io.mem.req.bits.signed := false.B
  io.mem.req.bits.dprv := PRV.S.U // UIPI accesses are S-mode by definition
  io.mem.req.bits.dv := io.cmd.bits.status.dv
  io.mem.s1_data.data := uintc_data
  io.mem.s1_kill := false.B
  io.mem.s2_kill := false.B

  // Stage 0: Fire from IDLE
  when(io.cmd.fire) {
    state := Mux(send, s_wait_mem0, s_wait_mem1)
    uist_addr := (io.cmd.bits.rs1 << uisteBytes).asUInt + (uintr.suist.base << pgIdxBits)
    uintc_addr := opAddr(uintr.suirs.index) | Mux(write || read, highOpOffset.asUInt, actOpOffset.asUInt)
    uintc_data := Mux(write, io.cmd.bits.rs1, Mux(activate, 1.U, 0.U))
    read_valid := read
  }

  // Stage 1: Load sender status
  when(state === s_wait_mem0 && io.mem.req.fire) { state := s_read_uist }
  when(state === s_read_uist && io.mem.resp.valid) {
    val uiste = new UISTE().fromBits(io.mem.resp.bits.data)
    uintc_addr := opAddr(uiste.uirs_idx) | sendOpOffset.asUInt
    uintc_data := uiste.vector
    state := s_wait_mem1
  }

  /**
   * Stage 2 (common stage): UINTC.
   * MMIO write requests have no response, thus we must check the s2_nack signal to replay the request.
   * s2_nack is always raised 2 cycles after the request.
   */
  when(state === s_wait_mem1 && io.mem.req.fire) { state := Mux(read_valid, s_resp, s_check_nack0) }
  when(state === s_check_nack0) { state := s_check_nack1 }
  when(state === s_check_nack1) { state := Mux(io.mem.s2_nack, s_wait_mem1, s_resp) }

  // Response
  io.resp.valid := state === s_resp && (io.mem.resp.valid || !read_valid)
  io.resp.bits.rd := io.cmd.bits.inst.rd
  io.resp.bits.data := io.mem.resp.bits.data
  when(io.resp.fire) {
    state := s_idle
    read_valid := false.B
  }
}