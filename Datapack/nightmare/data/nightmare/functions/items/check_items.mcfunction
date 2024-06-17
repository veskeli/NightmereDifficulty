# Generated with MC-Build

scoreboard players reset @s Nightmare_Item_use
tag @s remove raycasting
#lead_on_a_stick
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{lead_on_a_stick:1b}}}] at @s run function nightmare:items/lead_on_a_stick/start_raycast
#stick_horse
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{stick_horse:1b}}}] at @s run function nightmare:items/stick_horse/start_raycast