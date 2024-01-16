#Nightmare Difficulty Generated

scoreboard players reset @s Nightmare_Item_Ray_Return
scoreboard players reset .distance Nightmare_Item_Ray_steps
execute unless entity @s[nbt={Inventory:[{id:"minecraft:saddle"}]}] run tellraw @s {"text":"No saddle in inventory","color":"#F38A8A"}
execute unless entity @s[nbt={Inventory:[{id:"minecraft:saddle"}]}] run return 1
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s Nightmare_Item_Ray_Return run function nightmare:items/stick_horse/raycast
tag @s remove raycasting