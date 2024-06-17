# Generated with MC-Build

scoreboard players reset @a Nightmare_HeatLevel
execute as @a[nbt={Inventory:[{id:"minecraft:iron_helmet",Slot:103b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
execute as @a[nbt={Inventory:[{id:"minecraft:iron_chestplate",Slot:102b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
execute as @a[nbt={Inventory:[{id:"minecraft:iron_leggings",Slot:101b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
execute as @a[nbt={Inventory:[{id:"minecraft:iron_boots",Slot:100b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_helmet",Slot:103b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_chestplate",Slot:102b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_leggings",Slot:101b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_boots",Slot:100b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
#execute as @a[scores={Nightmare_HeatLevel=1..2}] run block{
#title @s actionbar {"text":"You are feeling warm"}
#}
execute as @a[scores={Nightmare_HeatLevel=3..}] run function nightmare_nether_survival:tools/zzz/0