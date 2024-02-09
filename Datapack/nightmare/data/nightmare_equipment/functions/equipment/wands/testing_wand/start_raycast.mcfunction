#Nightmare Difficulty Generated

scoreboard players reset @s Nm_Item_Ray_Return
scoreboard players reset .distance Nm_Item_Ray_steps
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nm_Item_Ray_Return run function nightmare_equipment:equipment/wands/testing_wand/raycast
tag @s remove raycasting