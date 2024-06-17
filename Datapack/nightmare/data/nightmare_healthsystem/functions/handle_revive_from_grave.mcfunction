# Generated with MC-Build

advancement revoke @s only nightmare_healthsystem:death_point_interaction
scoreboard players reset @s Nightmare_Item_Ray_Return
#grave digger
execute if entity @s[nbt={Inventory:[{id:"minecraft:wooden_shovel",tag:{grave_digger:1b}}]}] run function nightmare_healthsystem:zzz/4
execute if score @s Nightmare_Item_Ray_Return matches 1 run function nightmare_healthsystem:zzz/5