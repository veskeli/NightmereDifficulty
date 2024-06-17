# Generated with MC-Build

#Spawn Summoning circle
execute at @e[type=witch,tag=nightmare,scores={Nightmare_WitchSummonTimer=1}] run function nightmare:development/summonarmorstand
execute as @e[type=witch,tag=nightmare,scores={Nightmare_WitchSummonTimer=1}] run scoreboard players set @s Nightmare_WitchSummonTimer 5
#Timer scoreboard
scoreboard players remove @e[type=witch,tag=nightmare] Nightmare_WitchSummonTimer 1
schedule function nightmare:development/schedule_witchsummon 1s replace