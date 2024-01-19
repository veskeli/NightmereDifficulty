#Nightmare Difficulty Generated

function nightmare_healthsystem:temp_effects/calculate_overflow_in_half_hearts
scoreboard players set @s Nightmare_AbsortionHearts_Div 2
scoreboard players add @s Nightmare_AbsortionHearts_return 1
scoreboard players operation @s Nightmare_AbsortionHearts_return /= @s Nightmare_AbsortionHearts_Div