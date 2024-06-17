# Generated with MC-Build

# Volatile (nuke)
execute if predicate nightmare:10change run data merge entity @e[type=creeper,limit=1,tag=!nightmare] {Fuse:35,ExplosionRadius:8,Attributes:[{Name:"generic.movement_speed",Base:0.2}],CustomName:'{"text":"Volatile Creeper"}'}
# Quickfuse (insta)
execute if predicate nightmare:10change run data merge entity @e[type=creeper,limit=1,tag=!nightmare] {Fuse:15,ExplosionRadius:4,Attributes:[{Name:"generic.movement_speed",Base:2}],CustomName:'{"text":"Quickfuse Creeper"}'}
# Creeping
execute if predicate nightmare:10change run data merge entity @e[type=creeper,limit=1,tag=!nightmare] {Fuse:35,ExplosionRadius:3,Attributes:[{Name:"generic.movement_speed",Base:0.3}],CustomName:'{"text":"Creeping Creeper"}'}
#=================================================
# Vanilla
data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}