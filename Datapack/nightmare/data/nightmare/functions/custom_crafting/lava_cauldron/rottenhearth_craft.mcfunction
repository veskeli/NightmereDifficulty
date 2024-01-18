#Nightmare Difficulty Generated

execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare:items/summon_items/rottenheart
execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_success
execute at @s unless block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_fail
execute at @s if block ~ ~-1 ~ lava_cauldron run setblock ~ ~-1 ~ cauldron
kill @s