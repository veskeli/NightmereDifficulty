#Nightmare Difficulty Generated

function nightmare_healthsystem:temp_effects/calculate_overflow_health
execute if score @s Nightmare_AbsortionHearts matches 0.. run function nightmare_healthsystem:temp_effects/__generated__/block/17
execute if score @s Nightmare_AbsortionHearts matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearts
scoreboard players reset @s Nightmare_AbsortionHearts_Dirty