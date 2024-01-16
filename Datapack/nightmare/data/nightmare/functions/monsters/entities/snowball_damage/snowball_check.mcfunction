#Nightmare Difficulty Generated

execute as @a[scores={Nightmare_snowballs_used=1..}] run function nightmare:monsters/entities/snowball_damage/snowball_add_temp_immune
execute as @e[type=snowball] at @s run execute as @e[distance=..2,type=!snowball,tag=!snowball_immune,limit=1] run damage @s 4
tag @e[type=snow_golem,tag=!snowball_immune] add snowball_immune
scoreboard players reset @a Nightmare_snowballs_used