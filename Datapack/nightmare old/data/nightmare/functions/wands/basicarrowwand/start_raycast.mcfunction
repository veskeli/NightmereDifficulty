#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run tellraw @s {"text":"No arrows in inventory","color":"#F38A8A"}
execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=4..}] if entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] at @s run function nightmare:wands/basicarrowwand/__generated__/block/19