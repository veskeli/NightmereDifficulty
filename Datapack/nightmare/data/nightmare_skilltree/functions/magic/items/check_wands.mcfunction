# Generated with MC-Build

# check if the player has the test wand in their offhand
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{NDS_Wand:1b}}]}] at @s run function nightmare_skilltree:magic/items/check_wand_action
# check if the player has the test wand in their main hand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{NDS_Wand:1b}}}] at @s run function nightmare_skilltree:magic/items/check_wand_action