# Generated with MC-Build

# show mana bar if wnat is in the player's main hand
execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{NDS_Wand:1b}}}] run function nightmare_skilltree:magic/show_mana_bar
# show mana bar if wnat is in the player's off hand
execute as @a[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{NDS_Wand:1b}}]}] run function nightmare_skilltree:magic/show_mana_bar
# if the player used any wand, check what wand they used
execute as @a if score @s NDS_UsedWandOrStaff matches 1.. run function nightmare_skilltree:magic/items/check_wands
# reset the used wand score
scoreboard players reset @a NDS_UsedWandOrStaff
# Check if player left the select spell chest
execute as @e[type=minecraft:chest_minecart,tag=objd_gui_cart] run function nightmare_skilltree:check_select_spell_chest