#Nightmare Difficulty Generated

scoreboard players operation @s Nightmare_AbsortionHearths_NewTest = @s Nightmare_AbsortionHearths
scoreboard players operation @s Nightmare_AbsortionHearths_NewTest -= @s Nightmare_AbsortionHearths_return
execute if score @s Nightmare_AbsortionHearths_NewTest matches 0 run scoreboard players operation @s Nightmare_AbsortionHearths -= @s Nightmare_AbsortionHearths_return