execute if entity @s[tag=!InAir] run scoreboard players set @s advancedgliderDurability 0
execute if entity @s[tag=!InAir] run scoreboard players set @s advancedglidereffect 0
execute if entity @s[tag=!InAir] run scoreboard players set @s advancedgliderCharge 120
execute if entity @s[tag=!InAir,scores={slowfalleffect=2}] run scoreboard players set @s slowfalleffect 0
execute if entity @s[tag=InAir,nbt=!{SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}},scores={advancedgliderDurability=1..}] run scoreboard players set @s advancedgliderDurability 160
execute if entity @s[tag=InAir,nbt=!{SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}},scores={advancedgliderDurability=1..}] run function nightmare:glidereffects/clearadvancedglider
execute if entity @s[tag=InAir,nbt={SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}}] run scoreboard players add @s advancedgliderDurability 1


execute if entity @s[tag=InAir,scores={advancedgliderDurability=..119},nbt={SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}}] run scoreboard players remove @s advancedgliderCharge 1 

execute if entity @s[nbt={SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}}] run title @s actionbar ["",{"text":"Advanced Glider","color":"aqua"},{"text":" Charge: "},{"score":{"name":"@s","objective":"advancedgliderCharge"}}]

execute if entity @s[tag=InAir,scores={advancedgliderDurability=..119},nbt={SelectedItem:{id:"minecraft:enchanted_book",Count:1b,tag:{advancedglider:1b}}}] run scoreboard players set @s advancedglidereffect 1
execute if entity @s[tag=InAir,scores={advancedgliderDurability=120}] run function nightmare:glidereffects/clearadvancedglider
execute if entity @s[tag=InAir,scores={advancedgliderDurability=120..}] run scoreboard players set @s advancedglidereffect 0

execute if entity @s[tag=InAir,scores={advancedglidereffect=1}] run scoreboard players set @s slowfalleffect 1