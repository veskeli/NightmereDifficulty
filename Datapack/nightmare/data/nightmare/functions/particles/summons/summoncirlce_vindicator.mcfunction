#Nightmare Difficulty Generated

execute as @e[type=minecraft:armor_stand,scores={SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run function nightmare:monsters/summons/summoncirlce_vindicator
execute at @e[type=minecraft:armor_stand,scores={SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run spreadplayers ~ ~ 2 5 false @e[type=minecraft:armor_stand,sort=nearest,limit=1]
scoreboard players remove @e[type=minecraft:armor_stand,tag=SummonCircle_Vindicator] SummonCircle_Vindicator 1