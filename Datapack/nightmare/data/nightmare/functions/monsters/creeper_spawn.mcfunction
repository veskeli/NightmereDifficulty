# Generated with MC-Build

#nuke
execute if predicate nightmare:10change run data data_normal_creeper 35 8 0.2 Nuke Creeper
#insta
execute if predicate nightmare:10change run data data_normal_health_named creeper 15 4 2 Insta Creeper
#Creeping
execute if predicate nightmare:10change run data data_normal_creeper 35 3 0.3 Creeping Creeper
#=================================================
# Vanilla
data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}