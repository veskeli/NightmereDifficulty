#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add nightmare
data merge entity @s {NoGravity:1b,Silent:1b,DeathLootTable:"empty",ActiveEffects:[{Id:14,Amplifier:1b,Duration:10,ShowParticles:0b}]}
teleport @s ~ ~300 ~
kill @s
summon zombie ~ ~ ~ {Tags:["nightmare","bloodking"],Health:200f,IsBaby:0b,DeathLootTable:"nightmare:entities/named_boss_loot",CustomName:'{"text":"Blood king","color":"red","bold":true}',CanPickUpLoot:0b,CanBreakDoors:1b,HandItems:[{id:"minecraft:diamond_axe",Count:1b,tag:{display:{Name:'{"text":"Bloody Axe","color":"red","bold":true}',Lore:['{"text":"Blood king\'s favorite tool for defeating all his enemies."}']},Damage:0.4,Enchantments:[{id:"minecraft:sharpness",lvl:5s}]}},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:16711680}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],Attributes:[{Base:12.0d,Name:"generic.attack_damage"},{Name:generic.follow_range,Base:60},{Name:zombie.spawn_reinforcements,Base:1},{Name:generic.max_health,Base:200}]}
tag @e[type=zombie,name="Blood king"] add bloodking
tag @e[type=zombie,name="Blood king"] add nightmere
particle dust 1 0 0 5 ~ ~1 ~ 1 .6 1 0 50 normal