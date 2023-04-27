package freechips.rocketchip.uintr

import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._

class WithUIPI extends Config((site, here, up) => {
  case BuildRoCC => Seq((p: Parameters) => {
    val module = LazyModule(new UIPI(OpcodeSet.custom3)(p))
    module
  })
})

class UintrConfig extends Config(new DefaultConfig ++ new WithUIPI)