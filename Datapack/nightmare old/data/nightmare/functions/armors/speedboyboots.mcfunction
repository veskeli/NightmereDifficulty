#execute if entity @s[nbt={Inventory:[{tag:{SpeedBoyBoots:1b}},{Slot:100b}]}] as @s run effect give @s speed 1 6 true
execute if predicate nightmare:speedboyboots as @s run scoreboard players set @s speedboyboots_effect 1
execute unless predicate nightmare:speedboyboots as @s run scoreboard players set @s speedboyboots_effect 0
#/give @s leather_boots{SpeedBoyBoots:1b,display:{Name:'[{"text":"Leather Boots","italic":false}]',Lore:['[{"text":"Modifier: ","italic":false},{"text":"Speed boost 7","color":"yellow"}]']}} 1