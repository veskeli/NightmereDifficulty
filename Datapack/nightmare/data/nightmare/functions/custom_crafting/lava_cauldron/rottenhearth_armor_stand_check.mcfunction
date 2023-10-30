#Nightmare Difficulty Generated

execute as @e[type=armor_stand,tag=rottenhearth,limit=1,scores={Nightmare_FloorCraft_RottenHeartCooldown=50..}] run function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft
scoreboard players add @e[type=armor_stand,tag=rottenhearth] Nightmare_FloorCraft_RottenHeartCooldown 1