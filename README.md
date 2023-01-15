# qb-weaponrepair
A simple resource to repair weapons for an economy server. Repairs are limited and the max amount you can repair is decreased each time you repair. Once you reach 20% while repairing you can no longer repair that weapon.

---------- ADD TO QB-WEAPONS CLIENT -------------

```
RegisterNetEvent('weapons:client:SetWeaponQuality', function(amount)
     if CurrentWeaponData and next(CurrentWeaponData) then
         TriggerServerEvent("weapons:server:SetWeaponQuality", CurrentWeaponData, amount)
     end
 end)
```

---------- ADD TO QB-WEAPONS SERVER -------------

```
RegisterNetEvent("weapons:server:SetWeaponQuality", function(data, hp)
     local src = source
     local Player = QBCore.Functions.GetPlayer(src)
     local WeaponSlot = Player.PlayerData.items[data.slot]
     WeaponSlot.info.quality = hp
     Player.Functions.SetInventory(Player.PlayerData.items, true)
end)
```

---------- ADD TO SHARED ITEMS -------------

```
['weaponrepairkit']                	 = {['name'] = 'weaponrepairkit',               	['label'] = 'Weapon repair kit',             ['weight'] = 2000,       ['type'] = 'item',      ['image'] = 'weaponrepairkit.png',        	['unique'] = true,     ['useable'] = true,     ['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A repair kit for your weapon. Not meant for permanent repairs.'},
```


---------- RUN SQL THROUGH DATABASE -------------

```
CREATE TABLE `weaponrepair` (
`serial` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
`MaxHealth` INT(255) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
```
