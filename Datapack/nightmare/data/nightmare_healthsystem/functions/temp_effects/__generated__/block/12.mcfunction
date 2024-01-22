#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_HoneyBottleEat
clear @s minecraft:glass_bottle 1
function nightmare_healthsystem:temp_effects/check_current_absortion
tag @s add honey_absortion
scoreboard players add @s Nightmare_AbsortionHearts 1
scoreboard players add @s Nightmare_AbsortionHearts_Dirty 1