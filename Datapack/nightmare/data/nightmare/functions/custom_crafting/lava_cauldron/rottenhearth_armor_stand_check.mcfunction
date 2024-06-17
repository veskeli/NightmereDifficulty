# Generated with MC-Build

#if score/timer then craft
execute as @e[type=item_display,tag=rottenhearth,limit=1,scores={Nightmare_FloorCraft_RottenHeartCooldown=50..}] run function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft
#Timer
scoreboard players add @e[type=item_display,tag=rottenhearth] Nightmare_FloorCraft_RottenHeartCooldown 1