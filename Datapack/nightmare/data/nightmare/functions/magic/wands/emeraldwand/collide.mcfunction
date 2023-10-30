#Nightmare Difficulty Generated

scoreboard players add .distance Nightmare_Wand_steps 700
ride @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] mount @s
playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10