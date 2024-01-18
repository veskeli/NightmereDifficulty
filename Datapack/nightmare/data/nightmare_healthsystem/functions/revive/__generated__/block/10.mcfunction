#Nightmare Difficulty Generated

execute at @s run function nightmare:items/summon_items/rottenheart
execute at @s run scoreboard players set @e[limit=1,sort=nearest,nbt={Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{rottenhearth:1b}}}] Nightmare_ReviveItemBlock 1
execute at @s run function nightmare:particles/effects/lava_cauldron_craft_fail
kill @s