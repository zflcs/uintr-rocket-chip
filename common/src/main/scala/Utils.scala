package freechips.rocketchip.uintr

import chisel3._

trait UintrConsts {
  def UIPI_SEND       = 0.U(12.W)
  def UIPI_READ       = 1.U(12.W)
  def UIPI_WRITE      = 2.U(12.W)
  def UIPI_ACTIVATE   = 3.U(12.W)
  def UIPI_DEACTIVATE = 4.U(12.W)
}

class SUIRS extends Bundle {
  val en = Bool()
  val zero = UInt(47.W)
  val index = UInt(16.W)
}

class SUIST() extends Bundle {
  val en = Bool()
  val zero = UInt(7.W)
  val size = UInt(12.W)
  val base = UInt(44.W)
}

class CSRUintrIO extends Bundle {
  val suirs = new SUIRS()
  val suist = new SUIST()
  val suicfg = UInt(64.W)
}