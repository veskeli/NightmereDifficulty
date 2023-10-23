#built using mc-build (https://github.com/mc-build/mc-build)

data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:2}] {RaidId:2,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.5},{Name:generic.attack_damage,Base:24}]}
execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare
execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run function nightmare:custom_monsters/__generated__/block/69