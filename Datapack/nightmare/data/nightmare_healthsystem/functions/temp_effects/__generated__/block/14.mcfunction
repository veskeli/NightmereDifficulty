#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_AbsortionHearts_NewTest
scoreboard players operation @s Nightmare_AbsortionHearts_NewTest = @s Nightmare_AbsortionHearts
scoreboard players operation @s Nightmare_AbsortionHearts_NewTest -= @s Nightmare_AbsortionHearts_return
execute if score @s Nightmare_AbsortionHearts_NewTest matches 0 run return 1
scoreboard players operation @s Nightmare_AbsortionHearts -= @s Nightmare_AbsortionHearts_NewTest