tp @s ^ ^ ^0.5

#particle flame ~ ~ ~ 0 0 0 0 1 force

execute if entity @e[type=creeper,distance=..1.5] run tag @s add hitCreeper

execute unless block ~ ~ ~ #nightmare:ray_permeable run tag @s add hitBlock

scoreboard players remove @s steps 1

execute as @s[tag=!hitCreeper,tag=!hitBlock,scores={steps=1..}] at @s run function nightmare:ray/move