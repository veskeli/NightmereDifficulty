#Nightmare Difficulty Generated

execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:items/stick_horse/__generated__/block/4
execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run return 1
execute unless block ~ ~ ~ #nightmare:raycast_pass run return 2
execute if score .distance Nightmare_Item_Ray_steps matches 200 run return 3
scoreboard players add .distance Nightmare_Item_Ray_steps 1
execute positioned ^ ^ ^0.1 rotated ~ ~ run function nightmare:items/stick_horse/raycast