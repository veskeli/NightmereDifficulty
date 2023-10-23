#Speed boy
execute if predicate nightmare:50change run data merge entity @s[type=husk,tag=!nightmare] {Attributes:[{Base:5.0d,Name:"generic.attack_damage"},{Base:0.5d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","speedboy"],Name:zombie.spawn_reinforcements,Base:1}
#strong boy
execute as @s[type=husk,tag=!nightmare] run data merge entity @s {Attributes:[{Base:12.0d,Name:"generic.attack_damage"},{Base:0.23d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"],Name:zombie.spawn_reinforcements,Base:1}