# Generated with MC-Build

#Summon armor stand (handles crafting check)
#summon armor_stand ~ ~ ~ {Tags:[rottenhearth],Invulnerable:1b,NoGravity:1b,Invisible:1b}
summon item_display ~ ~ ~ {item:{id:"minecraft:rotten_flesh",Count:1b},Tags:[rottenhearth],billboard:"vertical"}
#Center armor stand
execute at @s align xyz run tp @e[type=item_display,tag=rottenhearth,sort=nearest,limit=1] ~.5 ~.5 ~.5
#Show particles
execute at @s run function nightmare_particle:particles/effects/lava_cauldron_craft_start
#Destroy craft items (rotten flesh)
kill @s