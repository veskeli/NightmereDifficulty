# Generated with MC-Build

# speedboy
execute if predicate nightmare:10change run execute as @e[type=husk,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:5,Name:"generic.attack_damage"},{Base:0.55,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare","nightmare_speedboy"], CustomName:'{"text":"Quickstep Husk"}'}
#=================================================
# Vanilla
execute as @e[type=husk,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9,Name:"generic.attack_damage"},{Base:0.31,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}