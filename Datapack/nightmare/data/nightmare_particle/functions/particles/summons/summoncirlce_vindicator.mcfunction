#Nightmare Difficulty Generated

execute as @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run function nightmare:monsters/summons/summoncirlce_vindicator
execute at @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=50},name="SummonCircle_Vindicator"] run spreadplayers ~ ~ -0 4 false @e[type=minecraft:armor_stand,sort=nearest,limit=1]
execute as @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=50},name="SummonCircle_Vindicator"] run data merge entity @s {Tags:["SummonCircle_Vindicator"]}
scoreboard players remove @e[type=minecraft:armor_stand,tag=SummonCircle_Vindicator] Nightmare_SummonCircle_Vindicator 1