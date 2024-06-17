# Generated with MC-Build

#check if health has changed
scoreboard players operation @s Nightmare_AbsortionHearts_return = @s Nightmare_Health
scoreboard players operation @s Nightmare_AbsortionHearts_return1 = @s Nightmare_AbsortionHearts_Current_Health
scoreboard players operation @s Nightmare_AbsortionHearts_return -= @s Nightmare_AbsortionHearts_return1
execute if score @s Nightmare_AbsortionHearts_return matches 1.. run function nightmare_healthsystem:temp_effects/check_current_absortion
execute if score @s Nightmare_AbsortionHearts_return matches ..-1 run function nightmare_healthsystem:temp_effects/check_current_absortion