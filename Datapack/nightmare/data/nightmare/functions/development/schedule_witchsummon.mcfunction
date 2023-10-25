#Nightmare Difficulty Generated

execute at @e[type=witch,tag=nightmare,scores={Nightmare_WitchSummonTimer=1}] run function nightmare:development/summonarmorstand
scoreboard players remove @e[type=witch,tag=nightmare] Nightmare_WitchSummonTimer 1
schedule function nightmare:development/schedule_witchsummon 1s