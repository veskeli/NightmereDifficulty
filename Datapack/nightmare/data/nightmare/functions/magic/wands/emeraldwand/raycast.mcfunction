#Nightmare Difficulty Generated

execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:magic/wands/emeraldwand/collide
scoreboard players add .distance Nightmare_Wand_steps 1
execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
execute if score .distance Nightmare_Wand_steps matches ..700 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:magic/wands/emeraldwand/raycast
execute if score .distance Nightmare_Wand_steps matches ..700 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run teleport @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] ~ ~1 ~