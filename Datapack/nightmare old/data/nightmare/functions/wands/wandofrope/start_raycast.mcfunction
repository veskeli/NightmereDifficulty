#built using mc-build (https://github.com/mc-build/mc-build)

execute unless entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] run tellraw @s {"text":"No lead in inventory","color":"#F38A8A"}
execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] if entity @s[scores={Nightmare_Mana=1..}] run function nightmare:wands/wandofrope/__generated__/block/47