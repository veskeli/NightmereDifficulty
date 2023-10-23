#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] unless block ~ ~ ~ #firearrows:unburnable unless score @s fireExpended matches 1 if block ~ ~ ~ air run setblock ~ ~ ~ minecraft:fire
execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] if block ~ ~ ~ minecraft:fire run scoreboard players set @s fireExpended 1
execute as @e[type=minecraft:arrow,nbt={inGround:0b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] unless block ~ ~ ~ minecraft:fire run scoreboard players set @s fireExpended 0
execute at @e[type=arrow,nbt=!{Fire:-1s},nbt=!{Fire:0s}] run particle smoke ~ ~ ~ 0.1 0.1 0.1 0.01 5 normal
tag @e[type=arrow,nbt={inGround:1b},nbt=!{Fire:-1s},nbt=!{Fire:0s}] add ArrowInGround
execute at @e[tag=ArrowInGround] run particle lava ~ ~ ~ 0.8 0.8 0.8 0.01 7 force
kill @e[tag=ArrowInGround]