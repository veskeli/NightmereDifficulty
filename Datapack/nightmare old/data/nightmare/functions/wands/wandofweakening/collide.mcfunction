#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1000
execute if entity @s run effect give @s weakness 15 0
execute if entity @s run effect give @s slowness 10 0
playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10