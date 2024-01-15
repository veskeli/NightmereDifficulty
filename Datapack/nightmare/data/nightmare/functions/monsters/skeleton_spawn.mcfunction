#Nightmare Difficulty Generated

execute if predicate nightmare:10change run execute as @e[type=skeleton,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:5,Name:"generic.attack_damage"},{Base:0.55,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare","nightmare_speedboy"]}
execute as @e[type=skeleton,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9,Name:"generic.attack_damage"},{Base:0.3,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}