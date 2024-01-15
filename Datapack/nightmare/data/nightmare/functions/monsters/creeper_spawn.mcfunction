#Nightmare Difficulty Generated

execute if predicate nightmare:10change run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:8b,Fuse:35,Tags:["nightmare"],Attributes:[{Name:"generic.movement_speed",Base:0.2}]}
execute if predicate nightmare:10change run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:4b,Fuse:15,Tags:["nightmare"],Attributes:[{Name:generic.max_health,Base:2}]}
data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}