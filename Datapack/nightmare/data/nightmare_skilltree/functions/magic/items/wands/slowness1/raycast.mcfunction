# Generated with MC-Build

# If hit entity
execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare_skilltree:magic/items/wands/slowness1/entity_hit
execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting,limit=1] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run return 1
# If hit block
execute unless block ~ ~ ~ #nightmare:raycast_pass run return 2
# If too many steps (is equal or more then .distance NDS_RangedSpellRange score)
execute if score .distance NDS_Item_Ray_steps >= .distance NDS_RangedSpellRange run return 3
# particle effect
execute if score .distance NDS_Item_Ray_steps matches 15.. run function nightmare_skilltree:magic/items/wands/slowness1/raycast/effect
# Update steps
scoreboard players add .distance NDS_Item_Ray_steps 1
# Loop
execute positioned ^ ^ ^0.1 rotated ~ ~ run function nightmare_skilltree:magic/items/wands/slowness1/raycast