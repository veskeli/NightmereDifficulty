# Generated with MC-Build

execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:26f,Attributes:[{Base:10d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"},{Base:26d,Name:"generic.max_health"}],Tags:["nightmare"],CustomName:'{"text":"Fierce Spider"}'}
execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:18f,Attributes:[{Base:20d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"},{Base:18d,Name:"generic.max_health"}],Tags:["nightmare"],CustomName:'{"text":"Sturdy Spider"}'}
#=================================================
# Vanilla
execute as @e[type=spider,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:6,Name:"generic.attack_damage"},{Base:0.42,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}