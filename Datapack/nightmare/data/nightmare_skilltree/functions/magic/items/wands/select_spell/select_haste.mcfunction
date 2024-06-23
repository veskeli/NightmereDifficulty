# Generated with MC-Build

# TODO: select correct player not closest one
# make sure the player has wand in hand
execute as @p[nbt={SelectedItem:{tag:{NDS_Wand:1b}}}] run function nightmare_skilltree:magic/items/wands/select_spell/zzz/2
# return on success
execute if entity @p[nbt={SelectedItem:{tag:{NDS_Wand:1b}}}] run return 0
# if not then make sure the player has offhand in hand
execute as @p[nbt={Inventory:[{Slot:-106b,tag:{NDS_Wand:1b}}]}] run function nightmare_skilltree:magic/items/wands/select_spell/zzz/3
# return on success
execute if entity @p[nbt={Inventory:[{Slot:-106b,tag:{NDS_Wand:1b}}]}] run return 1
# if not then say the player that he has no wand in hand
say @p "You have no wand in your hand"
# play sound indicating that the player has no wand in hand
playsound minecraft:block.note_block.bass master @p ~ ~ ~ 1 1