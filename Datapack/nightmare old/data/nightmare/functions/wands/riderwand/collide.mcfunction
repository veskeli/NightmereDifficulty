#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1000
execute at @s run particle dust 0.514 0.341 0.263 2 ~ ~1 ~ 0.1 0.1 0.1 0 3
data modify entity @s Passengers set from entity @p UUID