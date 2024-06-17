# Generated with MC-Build

#Reset waiting for revive
scoreboard players reset @p Nightmare_WaitingForRevive
#Set gamemode
gamemode survival @p
#teleport to item
execute at @s run teleport @p ~ ~ ~
#Set health based on what revive used
execute if entity @s[tag=rottenheart] run function nightmare_healthsystem:revive/zzz/1
execute if entity @s[tag=grave_digger] run function nightmare_healthsystem:revive/zzz/2
#particle
execute at @s run function nightmare_healthsystem:effects/revive_success
tag @s remove NoValidPlayer