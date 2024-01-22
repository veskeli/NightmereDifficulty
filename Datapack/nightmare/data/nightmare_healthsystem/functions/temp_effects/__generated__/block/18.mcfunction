#Nightmare Difficulty Generated

scoreboard players operation @s Nightmare_AbsortionHearts_NewTest = @s Nightmare_AbsortionHearts
scoreboard players operation @s Nightmare_AbsortionHearts_NewTest -= @s Nightmare_AbsortionHearts_return
execute if score @s Nightmare_AbsortionHearts_NewTest matches 0 run scoreboard players operation @s Nightmare_AbsortionHearts -= @s Nightmare_AbsortionHearts_return