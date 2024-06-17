# Generated with MC-Build

#Reset scoreboards
scoreboard players reset @s Nightmare_Item_Ray_Return
scoreboard players reset .distance Nightmare_Item_Ray_steps
#Check if lead in inventory
execute unless entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] run tellraw @s {"text":"No lead in inventory","color":"#F38A8A"}
execute unless entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] run return 1
#Raycast
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nightmare_Item_Ray_Return run function nightmare:items/lead_on_a_stick/raycast
tag @s remove raycasting
#Returns score to "@s" "Nightmare_Item_Ray_Return" base on hit: 1 entity, 2 block, 3 no hit
#scoreboard players set @s Nightmare_lead_on_a_stick_active 1