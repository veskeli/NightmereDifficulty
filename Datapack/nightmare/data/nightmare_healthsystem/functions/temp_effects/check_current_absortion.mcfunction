#Nightmare Difficulty Generated

execute as @s run scoreboard players set @s Nightmare_AbsortionHearts_return 0
scoreboard players operation @s Nightmare_AbsortionHearts_return = @s Nightmare_Health
scoreboard players operation @s Nightmare_AbsortionHearts_return -= @s Nightmare_AbsortionHearts_Current_Health
scoreboard players operation @s Nightmare_AbsortionHearts_Current_Health = @s Nightmare_Health
execute if score @s Nightmare_AbsortionHearts_return matches 0.. run return 0
execute if score @s Nightmare_AbsortionHearts matches 1.. run scoreboard players operation @s Nightmare_AbsortionHearts += @s Nightmare_AbsortionHearts_return
execute if score @s Nightmare_AbsortionHearts matches ..-1 run scoreboard players set @s Nightmare_AbsortionHearts 0