#Nightmare Difficulty Generated

execute if score @s Nightmare_AbsortionHearths_return matches 1.. run function nightmare_healthsystem:temp_effects/__generated__/block/14
tellraw @s ["",{"text":"Current return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths_return"}},{"text":" And add hearts: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]
execute if score @s Nightmare_AbsortionHearths matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearths
function nightmare_healthsystem:temp_effects/absortion_hearts_update