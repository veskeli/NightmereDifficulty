#built using mc-build (https://github.com/mc-build/mc-build)

data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:3}] {RaidId:3,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.6},{Name:generic.attack_damage,Base:32}]}
execute if entity @e[type=ravager,nbt={Passengers:[{id:"minecraft:vindicator",HandItems:[{id:"minecraft:tnt",Count:1b},{}]}]}] at @s run tag @s add TNT
execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare
execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run function nightmare:custom_monsters/__generated__/block/70