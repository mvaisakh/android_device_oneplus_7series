package msmnile

import (
    "android/soong/android"
    "android/soong/cc"
    "strings"
)

func fodFlags(ctx android.BaseContext) []string {
    var cflags []string

    var config = ctx.AConfig().VendorConfig("oneplusMsmnileFodPlugin")
    var posX = strings.TrimSpace(config.String("posX"))
    var posY = strings.TrimSpace(config.String("posY"))
    var size = strings.TrimSpace(config.String("size"))

    cflags = append(cflags, "-DFOD_POS_X=" + posX, "-DFOD_POS_Y=" + posY, "-DFOD_SIZE=" + size)
    return cflags
}

func fodHalBinary(ctx android.LoadHookContext) {
    type props struct {
        Target struct {
            Android struct {
                Cflags []string
            }
        }
    }

    p := &props{}
    p.Target.Android.Cflags = fodFlags(ctx)
    ctx.AppendProperties(p)
}

func fodHalBinaryFactory() android.Module {
    module, _ := cc.NewBinary(android.HostAndDeviceSupported)
    newMod := module.Init()
    android.AddLoadHook(newMod, fodHalBinary)
    return newMod
}

