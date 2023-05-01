package freechips.rocketchip.uintr

import Chisel._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.util._

/** Top module for zynq fpga, which will be wrapped with SoC block design  */
class Top()(implicit p: Parameters) extends Module {
  val target = Module(LazyModule(new FPGAZynqTop).module)

  val io = IO(new Bundle {
    val mem_axi4 = target.mem_axi4.cloneType
    val mmio_axi4 = target.mmio_axi4.cloneType
    val sys_reset = Input(Bool())
    val ext_intrs = Input(UInt(p(NExtTopInterrupts).W))

    // TODO: Jtag DEBUG
  })

  io.mem_axi4 <> target.mem_axi4
  io.mmio_axi4 <> target.mmio_axi4

  target.reset := reset | io.sys_reset // outer reset
  target.interrupts := io.ext_intrs

  target.dontTouchPorts()
}

class FPGAZynqTop(implicit p: Parameters) extends RocketSubsystem
  with HasAsyncExtInterrupts
  with CanHaveMasterAXI4MemPort
  with CanHaveMasterAXI4MMIOPort {
  // Note that setting BootROMLocated will override the reset_vector for all tiles
  val bootROM = p(BootROMLocated(location)).map {
    BootROM.attach(_, this, CBUS)
  }

  override lazy val module = new FPGAZynqTopModuleImp(this)
}

class FPGAZynqTopModuleImp(_outer: FPGAZynqTop) extends RocketSubsystemModuleImp(_outer)
  with HasRTCModuleImp
  with HasExtInterruptsModuleImp
  with DontTouch {
  lazy val mem_axi4 = outer.mem_axi4
  lazy val mmio_axi4 = outer.mmio_axi4
}