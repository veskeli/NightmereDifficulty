# Generated with MC-Build

execute if score .distance NDS_Item_Ray_steps matches ..6 run return 1
effect give @s minecraft:slowness 25 1 true
tellraw @s ["",{"text":"Magic","color":"dark_gray"},{"text":" | ","color":"white"},{"text":"Cast","color":"aqua"},{"text":" = ","color":"dark_gray"},{"text":"Got Slowness 2 for 25 seconds","color":"white"}]