# Generated with MC-Build

#Set spawnpoint to death location
execute at @s run spawnpoint @s ~ ~ ~
#Summon grave
execute at @s run function nightmare_healthsystem:summon_grave
#Set score
scoreboard players set @s Nightmare_WaitingForRevive 1
#Set player to spectator
gamemode spectator @s