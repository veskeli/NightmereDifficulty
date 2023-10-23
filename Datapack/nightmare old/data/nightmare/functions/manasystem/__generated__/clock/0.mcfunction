#built using mc-build (https://github.com/mc-build/mc-build)

schedule function nightmare:manasystem/__generated__/clock/0 0.1s
scoreboard players set @a Nightmare_MaxMana 0
scoreboard players operation @a Nightmare_MaxMana = $total Nightmare_MaxMana
execute as @a[scores={potionofevoker=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
execute as @a[scores={potionofillusioner=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
execute as @a[scores={potionofwitch=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
execute as @a[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{weakwizardhat:1b}}]},limit=1] run scoreboard players add @s Nightmare_MaxMana 5
execute as @a[nbt={Inventory:[{id:"minecraft:leather_helmet",Slot:103b,tag:{lostwizardhat:1b}}]},limit=1] run scoreboard players add @s Nightmare_MaxMana 10
execute as @a if score @s Nightmare_MaxMana < @s Nightmare_Mana run scoreboard players operation @s Nightmare_Mana = @s Nightmare_MaxMana