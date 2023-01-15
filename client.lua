local QBCore = exports['qb-core']:GetCoreObject()

if Config.Target then
    CreateThread(function()
        for k, v in pairs(Config.Models) do
            exports['qb-target']:AddTargetModel(v, {
                options = {
                    {
                        type = "client",
                        event = "qb-weaponrepair:repairclient",
                        icon = "fas fa-search-dollar",
                        label = "Use Repair Bench",
                    },
                },
                distance = 3.0
            })
        end
    end)
end

RegisterNetEvent("qb-weaponrepair:repairclient", function()
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if weapon ~= -1569615261 then
        TaskStartScenarioInPlace(ped, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
        QBCore.Functions.Progressbar("weapon_repair", "Repairing weapon...", Config.RepairTime, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true
        }, {}, {}, {}, function()
            ClearPedTasks(ped)
            TriggerServerEvent('qb-weaponrepair:server:repairweapon', weapon)
        end)
    else
        QBCore.Functions.Notify('You aren\'t holding a weapon.', 'error', 3000)
    end
end)


