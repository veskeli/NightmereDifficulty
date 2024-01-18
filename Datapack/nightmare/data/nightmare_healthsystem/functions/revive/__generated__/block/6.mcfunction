#Nightmare Difficulty Generated

scoreboard players reset @p Nightmare_WaitingForRevive
gamemode survival @p
execute at @s run teleport @p ~ ~ ~
execute if entity @s[tag=rottenheart] run function nightmare_healthsystem:revive/__generated__/block/7
execute if entity @s[tag=grave_digger] run function nightmare_healthsystem:revive/__generated__/block/8
execute at @s run function nightmare_healthsystem:effects/revive_success
tag @s remove NoValidPlayer