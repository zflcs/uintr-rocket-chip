package freechips.rocketchip.uintr

import freechips.rocketchip.config._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._

class WithBootROM extends Config((_, _, _) => {
  case BootROMLocated(InSubsystem) => Some(BootROMParams(
    hang = 0x10000,
    contentFileName = "../common/bootrom/bootrom.img"))
})

class WithUIPI extends Config((_, _, _) => {
  case BuildRoCC => Seq((p: Parameters) => {
    val module = LazyModule(new UIPI(OpcodeSet.custom3)(p))
    module
  })
})

class UintrConfig extends Config(
  new BaseSubsystemConfig ++
    new WithNBigCores(2) ++
    new WithNExtTopInterrupts(6) ++
    new WithTimebase((BigInt(10000000))) ++ // 10 MHz
    new WithDTS("freechips.rocketchip-unknown", Nil) ++
    new WithBootROM ++
    new WithUIPI ++
    new WithDefaultMemPort ++
    new WithDefaultMMIOPort ++
    new WithoutTLMonitors ++
    new WithCoherentBusTopology
)

class UintrTestConfig extends Config(new DefaultConfig ++ new WithUIPI)