# Generated with MC-Build

# Reset scoreboards
scoreboard players reset @s Nightmare_Item_Ray_Return
scoreboard players reset .distance Nightmare_Item_Ray_steps
# Raycast
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nightmare_Item_Ray_Return run function nightmare:items/lead_on_a_stick/raycast
tag @s remove raycasting
# Returns score to "@s" "Nightmare_Item_Ray_Return" base on hit: 1 entity, 2 block, 3 no hit
# execute if score @s Nightmare_Item_Ray_Return matches <value> run <Function>