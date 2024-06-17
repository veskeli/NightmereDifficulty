# Generated with MC-Build

#execute unless block ~ ~1 ~ air run return 1
#execute unless blocks ~4 ~ ~4 ~-4 ~ ~-4 0 200 0 all run return 1
#Check
scoreboard players reset @s Nightmare_Item_Ray_Return
execute store result score @s Nightmare_Item_Ray_Return run function nightmare_nether_survival:custom_crafting/soul_forge/soultest
#if not then return
execute unless score @s Nightmare_Item_Ray_Return matches 0 run return 1
#Craft success
summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1}}
kill @s