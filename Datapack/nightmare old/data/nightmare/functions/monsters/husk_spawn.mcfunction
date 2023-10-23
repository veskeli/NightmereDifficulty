#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:25change run execute as @e[type=husk,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalhusk
execute if predicate nightmare:bloodkingchange run execute as @e[type=husk,tag=!nightmare,limit=1] run function nightmare:monsters/bloodking
execute as @s[type=husk,tag=!nightmare] run data merge entity @s {Attributes:[{Base:9.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"],CustomName:'{"text":"Better Husk"}'}