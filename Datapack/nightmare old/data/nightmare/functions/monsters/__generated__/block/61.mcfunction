#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add nightmare
data merge entity @s {NoGravity:1b,Silent:1b,DeathLootTable:"empty",ActiveEffects:[{Id:14,Amplifier:1b,Duration:10,ShowParticles:0b}]}
teleport @s ~ ~300 ~
kill @s
summon vindicator ~ ~ ~ {DeathLootTable:"empty",Tags:["nightmare","Cavedweller"],CustomName:'{"text":"Cave dweller","color":"aqua"}',HandItems:[{id:"minecraft:iron_pickaxe",Count:1b,tag:{display:{Name:'{"text":"Cave dweller\'s pickaxe","color":"aqua"}'},RepairCost:100,Damage:0-0.5,Enchantments:[{id:"minecraft:fortune",lvl:5s}]}},{}],ArmorItems:[{},{},{},{id:"minecraft:golden_helmet",Count:1b,tag:{display:{Name:'{"text":"Cave dweller\'s  helmet","color":"aqua","italic":false}',Lore:['[{"text":"Modifier","color":"light_purple","italic":false},{"text":" haste 2","color":"yellow","italic":false}]']},haste2helmet:1b}}]}
tag @e[type=vindicator,name="Cave dweller"] add Cavedweller
tag @e[type=vindicator,name="Cave dweller"] add nightmere
particle flame ~ ~ ~ .1 .1 .1 0 400 normal