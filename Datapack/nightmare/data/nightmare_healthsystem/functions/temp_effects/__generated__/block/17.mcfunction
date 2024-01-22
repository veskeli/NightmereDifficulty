#Nightmare Difficulty Generated

execute if score @s Nightmare_AbsortionHearts_return matches 1.. run function nightmare_healthsystem:temp_effects/__generated__/block/18
execute if score @s Nightmare_AbsortionHearts matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearts
function nightmare_healthsystem:temp_effects/absortion_hearts_update