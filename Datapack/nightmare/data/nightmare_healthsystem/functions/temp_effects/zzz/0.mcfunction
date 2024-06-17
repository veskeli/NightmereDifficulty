# Generated with MC-Build

scoreboard players reset @s Nightmare_HoneyBottleEat
clear @s minecraft:glass_bottle 1
#Check and update current absortion hearts score
function nightmare_healthsystem:temp_effects/check_current_absortion
tag @s add honey_absortion
#Add and update absortion
scoreboard players add @s Nightmare_AbsortionHearts 2
scoreboard players add @s Nightmare_AbsortionHearts_Dirty 1
#effect clear @s absorption
#effect give @s absorption infinite 0 true