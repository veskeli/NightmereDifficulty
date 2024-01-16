#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_Item_Ray_Return
scoreboard players reset .distance Nightmare_Item_Ray_steps
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nightmare_Item_Ray_Return run function nightmare:items/lead_on_a_stick/raycast
tag @s remove raycasting