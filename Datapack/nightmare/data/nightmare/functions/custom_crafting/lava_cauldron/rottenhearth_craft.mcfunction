#Nightmare Difficulty Generated

execute at @s if block ~ ~-1 ~ lava_cauldron run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Rotten hearth","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Revive player with 1 hearth","italic":false,"color":"yellow"}]']},rottenhearth:1b}}}
execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_success
execute at @s unless block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_fail
execute at @s if block ~ ~-1 ~ lava_cauldron run setblock ~ ~-1 ~ cauldron
kill @s