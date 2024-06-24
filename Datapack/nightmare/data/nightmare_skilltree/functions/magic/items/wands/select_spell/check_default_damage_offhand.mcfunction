# Generated with MC-Build

item modify entity @s weapon.offhand nightmare_skilltree:add_default_damage
# notify the player that the spell has been selected
tellraw @s ["",{"text":"Magic","color":"dark_gray"},{"text":" | ","color":"white"},{"text":"Selected spell","color":"green"},{"text":" = ","color":"dark_gray"},{"text":"default_damage","color":"white"}]
# play sound indicating that the spell has been selected
playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 1