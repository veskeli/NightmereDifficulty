#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:25change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b},{id:"minecraft:shield",Count:1b}]}
execute if predicate nightmare:10change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Enchantments:[{id:"minecraft:multishot",lvl:1s}]}}]}
execute if predicate nightmare:10change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Enchantments:[{id:"minecraft:piercing",lvl:4s}]}}]}
execute if predicate nightmare:25change at @e[type=pillager,limit=1,tag=!nightmare] run function nightmare:monsters/__generated__/block/64
data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"]}