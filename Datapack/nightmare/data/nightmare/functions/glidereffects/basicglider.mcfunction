execute if entity @s[tag=!InAir] run scoreboard players set @s basicgliderDurability 0
execute if entity @s[tag=!InAir] run scoreboard players set @s basicglidereffect 0
execute if entity @s[tag=!InAir] run scoreboard players set @s basicgliderCharge 30
execute if entity @s[tag=!InAir,scores={slowfalleffect=2}] run scoreboard players set @s slowfalleffect 0
execute if entity @s[tag=InAir,nbt=!{SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}},scores={basicgliderDurability=1..}] run scoreboard players set @s basicgliderDurability 50
execute if entity @s[tag=InAir,nbt=!{SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}},scores={basicgliderDurability=1..}] run function nightmare:glidereffects/clearbasicglider
execute if entity @s[tag=InAir,nbt={SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}}] run scoreboard players add @s basicgliderDurability 1


execute if entity @s[tag=InAir,scores={basicgliderDurability=..29},nbt={SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}}] run scoreboard players remove @s basicgliderCharge 1 

execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}}] run title @s actionbar ["",{"text":"Basic Glider Charge: "},{"score":{"name":"@s","objective":"basicgliderCharge"}}]

execute if entity @s[tag=InAir,scores={basicgliderDurability=..29},nbt={SelectedItem:{id:"minecraft:wooden_axe",Count:1b,tag:{basicglider:1b}}}] run scoreboard players set @s basicglidereffect 1
execute if entity @s[tag=InAir,scores={basicgliderDurability=30}] run function nightmare:glidereffects/clearbasicglider
execute if entity @s[tag=InAir,scores={basicgliderDurability=30..}] run scoreboard players set @s basicglidereffect 0

execute if entity @s[tag=InAir,scores={basicglidereffect=1}] run scoreboard players set @s slowfalleffect 1