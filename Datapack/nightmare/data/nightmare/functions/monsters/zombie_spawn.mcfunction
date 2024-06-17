# Generated with MC-Build

# Rain zombie
# execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}
# custom small zombie with stick
execute if predicate nightmare:2change run execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {IsBaby:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:stick",Count:1b,tag:{display:{Name:'{"text":"Small Big Boy"}'},Enchantments:[{id:"minecraft:knockback",lvl:8s}],HandDropChances:[0.000F,0.085F]}},{}],ArmorItems:[{},{},{},{id:"minecraft:leather_helmet",Count:1b,tag:{Trim:{material:"minecraft:lapis",pattern:"minecraft:dune"}}}],Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.4},{Name:"generic.attack_damage",Base:8}]}
# Speedboy
execute if predicate nightmare:10change run execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:5,Name:"generic.attack_damage"},{Base:0.55,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare","nightmare_speedboy"], CustomName:'{"text":"Zombie Speedboy"}'}
# Strongboy
execute if predicate nightmare:10change run execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:12,Name:"generic.attack_damage"},{Base:0.23,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"], CustomName:'{"text":"Zombie Strongboy"}',CustomNameVisible:0b}
#=================================================
# Vanilla
execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9,Name:"generic.attack_damage"},{Base:0.3,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}