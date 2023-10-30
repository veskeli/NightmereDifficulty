#Nightmare Difficulty Generated

summon armor_stand ~ ~ ~ {Tags:[rottenhearth],Invulnerable:1b,NoGravity:1b,Invisible:1b}
execute at @s align xyz run tp @e[type=armor_stand,tag=rottenhearth,sort=nearest,limit=1] ~.5 ~.5 ~.5
execute at @s run function nightmare:particles/effects/lava_cauldron_craft_start
kill @s