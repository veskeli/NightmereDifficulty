# Generated with MC-Build

#Summon item
execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare:items/summon_items/rottenheart
#show particle success
execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare_particle:particles/effects/lava_cauldron_craft_success
#If lava cauldron not found show fail particle
execute at @s unless block ~ ~-1 ~ lava_cauldron run function nightmare_particle:particles/effects/lava_cauldron_craft_fail
#Empty lava cauldron
execute at @s if block ~ ~-1 ~ lava_cauldron run setblock ~ ~-1 ~ cauldron
#Kill executer == Armor stand
kill @s