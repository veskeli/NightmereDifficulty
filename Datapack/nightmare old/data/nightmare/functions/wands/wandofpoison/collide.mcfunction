#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1000
execute if entity @s run effect give @s wither 15 0
playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
execute at @s run particle dust 0.2 0.412 0.212 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10