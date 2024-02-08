#Nightmare Difficulty Generated

execute in minecraft:the_nether as @a if entity @s[nbt={Dimension:"minecraft:overworld"}] run execute as @s run function nightmare_nether_survival:teleport_to_nether
execute in minecraft:the_nether as @a if entity @s[nbt={Dimension:"minecraft:the_end"}] run execute as @s run function nightmare_nether_survival:teleport_to_nether
function nightmare_nether_survival:custom_crafting/check_crafts
function nightmare_nether_survival:tools/check_iron_tools