local ProtectionManager = require("client/protections/protection_manager")

---@class AntiWeaponPickupModule
local AntiWeaponPickup = {}

---@description Initialize Anti Weapon Pickup protection
function AntiWeaponPickup.initialize()
    if not Anti_Weapon_Pickup_enabled then return end
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1750)

            RemoveAllPickupsOfType(GetHashKey("PICKUP_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_ARMOUR_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_SNACK"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD"))
            RemoveAllPickupsOfType(GetHashKey("PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW"))
        end
    end)
end

ProtectionManager.register_protection("weapon_pickup", AntiWeaponPickup.initialize)

return AntiWeaponPickup 