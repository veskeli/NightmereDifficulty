# Generated with MC-Build

#Reset scoreboards
scoreboard players reset @s Nm_Item_Ray_Return
scoreboard players reset .distance Nm_Item_Ray_steps
#Raycast
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nm_Item_Ray_Return run function nightmare_equipment:equipment/wands/testing_wand/raycast
tag @s remove raycasting
#Returns score to "@s" "Nm_Item_Ray_Return" base on hit: 1 entity, 2 block, 3 no hit
#scoreboard players set @s Nm_testing_wand_active 1