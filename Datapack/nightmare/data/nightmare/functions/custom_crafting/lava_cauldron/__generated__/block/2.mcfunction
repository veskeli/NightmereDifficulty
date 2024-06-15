#Nightmare Difficulty Generated

summon item_display ~ ~ ~ {item:{id:"minecraft:rotten_flesh",Count:1b},Tags:[rottenhearth],billboard:"vertical"}
execute at @s align xyz run tp @e[type=item_display,tag=rottenhearth,sort=nearest,limit=1] ~.5 ~.5 ~.5
execute at @s run function nightmare_particle:particles/effects/lava_cauldron_craft_start
kill @s