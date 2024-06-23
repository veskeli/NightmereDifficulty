# Generated with MC-Build

# Reset the scoreboard
scoreboard players set @s NDS_FighterGuardiansRespiteCheck 0
tag @s add checking_for_enemies
# Count nearby zombified piglins within 10 blocks
execute as @e[type=#nightmare:undead_mob,distance=..10] run function nightmare_skilltree:fighter/guardians_respite_check/zzz/0
# Check if the count is 3 or more and run the function if true
execute as @s if score @s NDS_FighterGuardiansRespiteCheck matches 3.. run function nightmare_skilltree:fighter/guardians_respite_check/zzz/1
tag @s remove checking_for_enemies