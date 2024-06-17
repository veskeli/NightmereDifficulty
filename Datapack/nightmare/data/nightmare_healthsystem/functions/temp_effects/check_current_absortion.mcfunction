# Generated with MC-Build

#reset Nightmare_AbsortionHearts_return
execute as @s run scoreboard players set @s Nightmare_AbsortionHearts_return 0
#Get current health and store it in Nightmare_AbsortionHearts_return
scoreboard players operation @s Nightmare_AbsortionHearts_return = @s Nightmare_Health
#Subtract last current health to get the difference
scoreboard players operation @s Nightmare_AbsortionHearts_return -= @s Nightmare_AbsortionHearts_Current_Health
#update current abs current health
scoreboard players operation @s Nightmare_AbsortionHearts_Current_Health = @s Nightmare_Health
#if player gained health then return
execute if score @s Nightmare_AbsortionHearts_return matches 0.. run return 0
#if player has absortion hearts then check if they have lost any
execute if score @s Nightmare_AbsortionHearts matches 1.. run scoreboard players operation @s Nightmare_AbsortionHearts += @s Nightmare_AbsortionHearts_return
#if negative set abs hearths to 0 and return
execute if score @s Nightmare_AbsortionHearts matches ..-1 run scoreboard players set @s Nightmare_AbsortionHearts 0