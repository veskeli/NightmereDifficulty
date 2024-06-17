# Generated with MC-Build

scoreboard players reset @s Nm_Warped_Fungus_Used
#testing_wand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{testing_wand:1b}}}] at @s run function nightmare_equipment:equipment/wands/testing_wand/start_raycast
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{testing_wand_jump:1b}}}] at @s run function nightmare_equipment:equipment/wands/testing_wand_jump/start_raycast