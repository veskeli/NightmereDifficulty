# Generated with MC-Build

# Speedboy
execute if predicate nightmare:10change run execute as @e[type=zombified_piglin,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:5,Name:"generic.attack_damage"},{Base:0.5,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare","nightmare_speedboy"], CustomName:'{"text":"Quickstep Zombiefied Piglin"}'}
# Strongboy
execute if predicate nightmare:10change run execute as @e[type=zombified_piglin,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:12,Name:"generic.attack_damage"},{Base:0.24,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"], CustomName:'{"text":"Sturdy Zombiefied Piglin"}',CustomNameVisible:0b}
#=================================================
# Vanilla
execute as @e[type=zombified_piglin,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:7,Name:"generic.attack_damage"},{Base:0.31,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}