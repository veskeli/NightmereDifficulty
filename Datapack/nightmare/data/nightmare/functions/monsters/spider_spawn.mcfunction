# Generated with MC-Build

#execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:8f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
#execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Attributes:[{Base:3.0d,Name:"generic.attack_damage"},{Base:0.7d,Name:"generic.movement_speed"}],Tags:["nightmare","speedboy"]}
#execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:20f,Attributes:[{Base:4.0d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
execute if predicate nightmare:25change run data merger entity @e[type=spider,tag=!nightmare,limit=1] {Health:8f,Attributes:[{Base:10d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
execute if predicate nightmare:25change run data merger entity @e[type=spider,tag=!nightmare,limit=1] {Health:4f,Attributes:[{Base:20d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
#=================================================
# Vanilla
execute as @e[type=spider,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:6,Name:"generic.attack_damage"},{Base:0.42,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}