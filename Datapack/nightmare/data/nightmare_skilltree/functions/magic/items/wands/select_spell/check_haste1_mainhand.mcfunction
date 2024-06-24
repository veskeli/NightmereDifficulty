# Generated with MC-Build

item modify entity @s weapon.mainhand nightmare_skilltree:add_haste1
# notify the player that the spell has been selected
tellraw @s ["",{"text":"Magic","color":"dark_gray"},{"text":" | ","color":"white"},{"text":"Selected spell","color":"green"},{"text":" = ","color":"dark_gray"},{"text":"haste1","color":"white"}]
# play sound indicating that the spell has been selected
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 1