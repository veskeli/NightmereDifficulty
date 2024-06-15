#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_Item_Ray_Return
execute store result score @s Nightmare_Item_Ray_Return run function nightmare_nether_survival:custom_crafting/soul_forge/soultest
execute unless score @s Nightmare_Item_Ray_Return matches 0 run return 1
summon item ~ ~ ~ {Item:{id:"minecraft:sand",Count:1b}}
kill @s