#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:instacreeper run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {Health:15f,Attributes:[{Name:"generic.movement_speed",Base:0.28}],powered:1b,Fuse:2,Tags:["nightmare"]}
execute if predicate nightmare:bigboycreeper run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {Tags:["nightmare"],Attributes:[{Name:"generic.movement_speed",Base:0.24}],ExplosionRadius:6,Fuse:35}
data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}
execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27b,Amplifier:16b}]}] at @s run function nightmare:effects/poisonbomb
kill @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27b,Amplifier:16b}]}]