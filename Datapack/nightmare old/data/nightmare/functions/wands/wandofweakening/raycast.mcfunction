#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofweakening/collide
scoreboard players add .distance steps 1
execute unless entity @s[distance=..3] run particle dust 0.22 0.22 0.22 1 ~ ~ ~ 0 0 0 0 1
execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening/raycast
execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening/collide_block