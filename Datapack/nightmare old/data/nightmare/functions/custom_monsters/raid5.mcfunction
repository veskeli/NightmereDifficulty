#built using mc-build (https://github.com/mc-build/mc-build)

data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:4}] {RaidId:4,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.7},{Name:generic.attack_damage,Base:38}]}
execute as @e[type=ravager,nbt={Passengers:[{id:"minecraft:vindicator",HandItems:[{id:"minecraft:tnt",Count:1b},{}]}]}] run tag @s add TNT
execute if entity @e[type=witch,nbt={RaidId:4,ActiveEffects:[{Id:10,Amplifier:0b}]}] at @s run effect give @s regeneration 30 1
execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare
execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run function nightmare:custom_monsters/__generated__/block/71