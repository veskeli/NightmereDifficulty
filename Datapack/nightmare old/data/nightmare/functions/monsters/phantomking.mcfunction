execute as @s[tag=!nightmare] run data merge entity @s {CustomNameVisible:1b,Tags:["phantomking","nightmere"],CustomName:'{"text":"Phantom King","color":"dark_aqua","bold":true}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Phantom wisperer","color":"dark_aqua","bold":true}'},Enchantments:[{id:"minecraft:unbreaking",lvl:2s},{id:"minecraft:power",lvl:4s},{id:"minecraft:punch",lvl:2s},{id:"minecraft:mending",lvl:1s}]}},{}],HandDropChances:[0.085F,0.085F],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:26367},Enchantments:[{id:"minecraft:soul_speed",lvl:3s}]}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:26367}}}],ArmorDropChances:[0.085F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.max_health,Base:300},{Name:generic.follow_range,Base:60}]}
execute as @s[tag=!nightmare] run tag @s add phantomking
execute as @s[tag=!nightmare] run tag @s add nightmare