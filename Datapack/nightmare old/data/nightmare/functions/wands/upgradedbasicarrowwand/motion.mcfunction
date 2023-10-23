#built using mc-build (https://github.com/mc-build/mc-build)

execute store result score @s NMARROW_x1 run data get entity @s Pos[0] 1000
execute store result score @s NMARROW_y1 run data get entity @s Pos[1] 1000
execute store result score @s NMARROW_z1 run data get entity @s Pos[2] 1000
tp @s ^ ^ ^0.1
execute store result score @s NMARROW_x2 run data get entity @s Pos[0] 1000
execute store result score @s NMARROW_y2 run data get entity @s Pos[1] 1000
execute store result score @s NMARROW_z2 run data get entity @s Pos[2] 1000
scoreboard players operation @s NMARROW_x2 -= @s NMARROW_x1
scoreboard players operation @s NMARROW_y2 -= @s NMARROW_y1
scoreboard players operation @s NMARROW_z2 -= @s NMARROW_z1
execute store result entity @s Motion[0] double 0.03 run scoreboard players get @s NMARROW_x2
execute store result entity @s Motion[1] double 0.03 run scoreboard players get @s NMARROW_y2
execute store result entity @s Motion[2] double 0.03 run scoreboard players get @s NMARROW_z2
execute store result entity @s power[0] double 0.0000008 run scoreboard players get @s NMARROW_x2
execute store result entity @s power[1] double 0.0000008 run scoreboard players get @s NMARROW_y2
execute store result entity @s power[2] double 0.0000008 run scoreboard players get @s NMARROW_z2
tag @s add motion