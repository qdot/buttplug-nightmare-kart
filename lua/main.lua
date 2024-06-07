local UEHelpers = require("UEHelpers")

print("[ButtplugNMKartMod] Mod loaded\n")
print(_VERSION)


--local socket = require("socket")
-- local bp = require("buttplug_mlua")
-- bp.init()

-- local f = assert(package.loadlib("c:\\Users\\qdot\\code\\buttplug_mlua\\target\\release\\buttplug_mlua.dll", "*"))
-- print(f)
-- local k = f()
-- print(k)
-- print(k.hello)
-- local j = k.hello
-- print(j)
-- j("test")
local lastLocation = nil
local lastRaceSeconds = nil

--bp_lib.init();

function ReadPlayerLocation()
    local FirstPlayerController = UEHelpers:GetPlayerController()
    local Pawn = FirstPlayerController.Pawn
    local Location = Pawn:K2_GetActorLocation()
    print(string.format("[ButtplugNMKartMod] Player location: {X=%.3f, Y=%.3f, Z=%.3f}\n", Location.X, Location.Y, Location.Z))
    if lastLocation then
        print(string.format("[ButtplugNMKartMod] Player moved: {delta_X=%.3f, delta_Y=%.3f, delta_Z=%.3f}\n",
            Location.X - lastLocation.X,
            Location.Y - lastLocation.Y,
            Location.Z - lastLocation.Z)
        )
    end
    lastLocation = Location

    local KartPawn = FindFirstOf("BP_KartPawn_C")
    if not KartPawn:IsValid() then
      print("Cannot find BP_KartPawn_C instance")
    else
      print("Found BP_KartPawn_C")
      local KartUI = KartPawn.UW_KartUI_C
      if not KartUI:IsValid() then
        print("Cannot get valid UI instance")
      end
      print(string.format("[ButtplugNMKartMod] Accelerating: %s", KartPawn.IsAccelerating))
    end
end

RegisterKeyBind(Key.F1, { ModifierKey.CONTROL }, function()
    print("[ButtplugNMKartMod] Key pressed\n")
    ExecuteInGameThread(function()
        ReadPlayerLocation()
    end)
end)
