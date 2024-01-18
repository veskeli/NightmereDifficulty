#Nightmare Difficulty Generated

tellraw @s {"text":"\n "}
tellraw @s ["",{"text":"New abs level return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]
execute as @s run scoreboard players set @s Nightmare_AbsortionHearths_return 0
scoreboard players operation @s Nightmare_AbsortionHearths_return = @s Nightmare_Health
scoreboard players operation @s Nightmare_AbsortionHearths_return -= @s Nightmare_MaxHealth
scoreboard players set @s Nightmare_AbsortionHearths_Div 2
scoreboard players operation @s Nightmare_AbsortionHearths_return /= @s Nightmare_AbsortionHearths_Div
tellraw @s ["",{"text":"Current level return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths_return"}}]
execute if score @s Nightmare_AbsortionHearths matches 0.. run function nightmare_healthsystem:temp_effects/__generated__/block/13
execute if score @s Nightmare_AbsortionHearths matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearths
scoreboard players reset @s Nightmare_AbsortionHearths_Dirty