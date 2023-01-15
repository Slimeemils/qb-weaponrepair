local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-weaponrepair:server:repairweapon', function(weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weaponInfo = QBCore.Shared.Weapons[weapon]
    local serieNumber = nil
    if weaponInfo then
        local weaponItem = Player.Functions.GetItemByName(weaponInfo["name"])
        if weaponItem then
            if weaponItem.info and weaponItem.info ~= "" then
                serieNumber = weaponItem.info.serie
                local weaponhealth = nil
                exports.oxmysql:fetch("SELECT * FROM `weaponrepair` WHERE serial = '"..serieNumber.."'", function(result)
                    if result[1] ~= nil then
                        local repairamount = result[1].MaxHealth
                        if weaponItem.info.quality == 100 then                      
                            TriggerClientEvent('QBCore:Notify', src, "No need to repair this yet.", "error")
                        elseif repairamount == 100 then
                            if weaponItem.info.quality < 80 then
                                if not Config.RemoveItem then
                                    weaponhealth = 80
                                    exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                    TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                    TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 80%.")
                                else
                                    if Player.Functions.RemoveItem('weaponrepairkit', 1) then
                                        weaponhealth = 80
                                        exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                        TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                        TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 80%.")
                                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weaponrepairkit'], "remove")
                                    else
                                        TriggerClientEvent('QBCore:Notify', src, "You need a repair kit to repair your weapon.", "error")
                                    end
                                end
                            else
                                TriggerClientEvent('QBCore:Notify', src, "Wait until the durability is less than 80% to repair.", "error")
                            end
                        elseif repairamount == 80 then
                            if weaponItem.info.quality < 60 then
                                if not Config.RemoveItem then
                                    weaponhealth = 60
                                    exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                    TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                    TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 60%.")
                                else
                                    if Player.Functions.RemoveItem('weaponrepairkit', 1) then
                                        weaponhealth = 60
                                        exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                        TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                        TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 60%.")
                                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weaponrepairkit'], "remove")
                                    else
                                        TriggerClientEvent('QBCore:Notify', src, "You need a repair kit to repair your weapon.", "error")
                                    end
                                end
                            else
                                TriggerClientEvent('QBCore:Notify', src, "Wait until the durability is less than 60% to repair.", "error")
                            end
                        elseif repairamount == 60 then
                            if weaponItem.info.quality < 40 then
                                if not Config.RemoveItem then
                                    weaponhealth = 40
                                    exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                    TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                    TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 40%.")
                                else
                                    if Player.Functions.RemoveItem('weaponrepairkit', 1) then
                                        weaponhealth = 40
                                        exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                        TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                        TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 40%.")
                                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weaponrepairkit'], "remove")
                                    else
                                        TriggerClientEvent('QBCore:Notify', src, "You need a repair kit to repair your weapon.", "error")
                                    end
                                end
                            else
                                TriggerClientEvent('QBCore:Notify', src, "Wait until the durability is less than 40% to repair.", "error")
                            end
                        elseif repairamount == 40 then
                            if weaponItem.info.quality < 20 then
                                if not Config.RemoveItem then
                                    weaponhealth = 20
                                    exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                    TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                    TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 20%.")
                                else
                                    if Player.Functions.RemoveItem('weaponrepairkit', 1) then
                                        weaponhealth = 20
                                        exports.oxmysql:execute("UPDATE weaponrepair SET MaxHealth = '"..weaponhealth.."' WHERE serial = '"..serieNumber.."'")
                                        TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                        TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 20%.")                           
                                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weaponrepairkit'], "remove")
                                    else
                                        TriggerClientEvent('QBCore:Notify', src, "You need a repair kit to repair your weapon.", "error")
                                    end
                                end
                            else
                                TriggerClientEvent('QBCore:Notify', src, "Wait until the durability is less than 20% to repair.", "error")
                            end
                        elseif repairamount == 20 then
                            TriggerClientEvent('QBCore:Notify', src, "This piece of shit is falling apart buddy, you can\'t repair it anymore.", "error")
                        end
                    else
                        if weaponItem.info.quality < 100 then
                            if not Config.RemoveItem then
                                weaponhealth = 100	
                                exports.oxmysql:insert("INSERT INTO `weaponrepair` (`serial`, `MaxHealth`) VALUES ('"..serieNumber.."','"..weaponhealth.."')")
                                TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 100%.")
                            else
                                if Player.Functions.RemoveItem('weaponrepairkit', 1) then
                                    weaponhealth = 100	
                                    exports.oxmysql:insert("INSERT INTO `weaponrepair` (`serial`, `MaxHealth`) VALUES ('"..serieNumber.."','"..weaponhealth.."')")
                                    TriggerClientEvent('weapons:client:SetWeaponQuality', src, weaponhealth)
                                    TriggerClientEvent('QBCore:Notify', src, "Your weapon has been restored to 100%.")
                                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['weaponrepairkit'], "remove")
                                else
                                    TriggerClientEvent('QBCore:Notify', src, "You need a repair kit to repair your weapon.", "error")
                                end
                            end
                        else
                            TriggerClientEvent('QBCore:Notify', src, "No need to repair this yet.", "error")
                        end
                    end
                end)
            end
        end
    end
end)

if not Config.Target then
    QBCore.Functions.CreateUseableItem("weaponrepairkit", function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        TriggerClientEvent("qb-weaponrepair:repairclient", src)
    end)
end