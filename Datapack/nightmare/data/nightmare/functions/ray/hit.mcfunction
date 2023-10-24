
#execute if entity @p[scores={Nightmare_Mana=6..}] as @s run function nightmare:manasystem/startcooldown
execute if entity @p[scores={Nightmare_Mana=6..}] run execute run scoreboard players set @p Nightmare_ManaRegneration 3
execute if entity @p[scores={Nightmare_Mana=6..}] if block ~ ~1 ~ air if entity @p[nbt={Inventory:[{id:"minecraft:torch"}]}] run function nightmare:torchwand
execute if entity @p[scores={Nightmare_Mana=6..}] run execute run scoreboard players remove @p Nightmare_Mana 6
execute unless block ~ ~1 ~ air run title @p actionbar [{"text":"Not valid spot"}]