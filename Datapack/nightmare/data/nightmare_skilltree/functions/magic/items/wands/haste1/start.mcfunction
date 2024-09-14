# Generated with MC-Build

playsound minecraft:entity.illusioner.prepare_blindness player @a ~ ~ ~ 1 2
# add cooldown
scoreboard players set @s NDS_SpellCooldown 10
execute at @s run execute as @a[distance=..10] run function nightmare_skilltree:magic/items/wands/haste1/entity_hit
tellraw @s ["",{"text":"Magic","color":"dark_gray"},{"text":" | ","color":"white"},{"text":"Cast","color":"aqua"},{"text":" = ","color":"dark_gray"},{"text":"Applied Haste 2 for 25 seconds to all players in 10 meters","color":"white"}]