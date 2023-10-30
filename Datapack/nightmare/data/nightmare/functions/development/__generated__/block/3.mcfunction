#Nightmare Difficulty Generated

scoreboard players set @e[type=witch,tag=!nightmare,limit=1] Nightmare_WitchSummonTimer 3
data merge entity @s {Tags:["nightmare"]}
execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100