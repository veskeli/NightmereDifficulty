#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:25change run data merge entity @e[type=vindicator,limit=1,tag=!nightmare] {Tags:["tntvin"],HandItems:[{id:"minecraft:tnt",Count:1b},{id:"minecraft:tnt",Count:1b}],HandDropChances:[0.000F,0.000F]}
execute as @e[type=vindicator,nbt={HandItems:[{id:"minecraft:tnt",Count:1b},{}]},tag=!nightmare] run tag @s add tntvin
execute if predicate nightmare:25change run data merge entity @e[type=vindicator,limit=1,tag=!nightmare,nbt={RaidId:5}] {Tags:["nukevin"],HandItems:[{id:"minecraft:tnt",Count:2b},{id:"minecraft:tnt",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}],HandDropChances:[0.000F,0.000F]}
execute as @e[type=vindicator,nbt={HandItems:[{id:"minecraft:tnt",Count:2b},{}]},tag=!nightmare] run tag @s add nukevin
execute as @e[type=vindicator,limit=1,tag=!nightmare] run tag @s add nightmare
execute as @e[type=vex,tag=!nightmare] run data merge entity @s {Attributes:[{Name:generic.max_health,Base:4}]}
execute as @e[type=vex,tag=!nightmare] run tag @s add nightmare