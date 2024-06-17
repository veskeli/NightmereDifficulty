# Generated with MC-Build

#If hit entity
execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:items/stick_horse/zzz/0
execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run return 1
#If hit block
execute unless block ~ ~ ~ #nightmare:raycast_pass run return 2
#If too many steps
execute if score .distance Nightmare_Item_Ray_steps matches 200 run return 3
#Update steps
scoreboard players add .distance Nightmare_Item_Ray_steps 1
#Loop
execute positioned ^ ^ ^0.1 rotated ~ ~ run function nightmare:items/stick_horse/raycast