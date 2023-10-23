#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/riderwand/collide
scoreboard players add .distance steps 1
execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
execute if score .distance steps matches ..200 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/riderwand/raycast
execute if score .distance steps matches ..200 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run execute positioned ^ ^ ^-0.1 run function nightmare:wands/riderwand/collide_block