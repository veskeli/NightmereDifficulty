#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add nightmare
data merge entity @s {NoGravity:1b,Silent:1b,DeathLootTable:"empty",ActiveEffects:[{Id:14,Amplifier:1b,Duration:10,ShowParticles:0b}]}
teleport @s ~ ~300 ~
kill @s
summon skeleton ~ ~ ~ {CustomNameVisible:1b,Tags:["nightmare","phantomking"],DeathLootTable:"nightmare:entities/named_mini_boss_loot",CustomName:'{"text":"Phantom King","color":"dark_aqua","bold":true}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Phantom wisperer","color":"dark_aqua","bold":true}'},Enchantments:[{id:"minecraft:unbreaking",lvl:2s},{id:"minecraft:power",lvl:4s},{id:"minecraft:punch",lvl:2s}]}},{}],HandDropChances:[0.085F,0.085F],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:26367},Enchantments:[{id:"minecraft:soul_speed",lvl:3s}]}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:26367}}}],ArmorDropChances:[0.085F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.max_health,Base:300},{Name:generic.follow_range,Base:60}]}
tag @e[type=skeleton,name="Phantom King"] add phantomking
tag @e[type=skeleton,name="Phantom King"] add nightmere
particle soul_fire_flame ~ ~ ~ .2 .2 .2 0 400 normal