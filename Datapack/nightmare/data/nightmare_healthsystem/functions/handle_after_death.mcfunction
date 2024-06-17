# Generated with MC-Build

#Reset score
scoreboard players reset @s Nightmare_Death
#Do logic to handle after respawn
#Set player to spectator
gamemode spectator @s
#Show title
title @s times 20 100 20
title @s title {"text":"Waiting for revive"}
#sound
#execute at @s run playsound minecraft:entity.wither.death block @s ~ ~ ~