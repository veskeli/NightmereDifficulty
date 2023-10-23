#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:sneakskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:'{"text":"Sneak Attack","color":"blue"}',Lore:['{"text":"Foolish mortals","color":"blue"}']},Enchantments:[{id:"minecraft:sharpness",lvl:3s}]}}],Attributes:[{Name:generic.max_health,Base:100},{Name:generic.movement_speed,Base:0.6}]}
execute if predicate nightmare:meleeskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Tags:["nightmare","meleeskele"],HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Damage:0.1F}},{}]}
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:iron_axe",Count:1b,tag:{Damage:0.1F}},{}]}
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:golden_axe",Count:1b,tag:{Damage:0.1F}},{}]}
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:golden_sword",Count:1b,tag:{Damage:0.1F}},{}]}
execute if predicate nightmare:speedskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.5d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","speedboy"],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{Lore:['[{"text":"Modifier: ","color":"light_purple","italic":false},{"text":"Speed boost IV","color":"yellow"}]']},SpeedBoyBoots:1b}},{},{},{}]}
execute if predicate nightmare:meleeskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.5d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:bow",Count:1b,tag:{Damage:0.1-0.3,Enchantments:[{id:"minecraft:flame",lvl:1s}]}}]}
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","slownessskeleton"]}
execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=slownessskeleton] run tag @s add slownessskeleton
execute as @e[type=minecraft:arrow,tag=slownessskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:2,Amplifier:2b,Duration:70},{Id:15,Amplifier:1b,Duration:50}]}
execute as @e[type=minecraft:arrow,tag=slownessskeleton] run tag @s add arroweffect
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","levitationskeleton"]}
execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=levitationskeleton] run tag @s add levitationskeleton
execute as @e[type=minecraft:arrow,tag=levitationskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:25,Amplifier:1b,Duration:60,ShowParticles:1b}]}
execute as @e[type=minecraft:arrow,tag=levitationskeleton] run tag @s add arroweffect
execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","betterlevitationskeleton"]}
execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=betterlevitationskeleton] run tag @s add betterlevitationskeleton
execute as @e[type=minecraft:arrow,tag=betterlevitationskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:15,Amplifier:1b,Duration:40},{Id:25,Amplifier:1b,Duration:60,ShowParticles:1b}]}
execute as @e[type=minecraft:arrow,tag=betterlevitationskeleton] run tag @s add arroweffect
execute if predicate nightmare:10change run function nightmare:custom_monsters/teleportskeleton_summon
function nightmare:custom_monsters/teleportskeleton
data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}