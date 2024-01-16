#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_Item_use
tag @s remove raycasting
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{lead_on_a_stick:1b}}}] at @s run function nightmare:items/lead_on_a_stick/start_raycast
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{stick_horse:1b}}}] at @s run function nightmare:items/stick_horse/start_raycast