#built using mc-build (https://github.com/mc-build/mc-build)

execute if predicate nightmare:25change run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalzombie
execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}
execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}
execute at @e[type=zombie,tag=bloodking,nbt={HurtTime:10s}] run particle dust 1 0 0 5 ~ ~1 ~ 1 .6 1 0 50
execute if predicate nightmare:50change at @e[type=zombie,tag=bloodking,nbt={HurtTime:10s}] if block ^ ^ ^-1 air run summon zombie ^ ^ ^-1 {Tags:["bloodkingfollower"]}
execute run execute as @e[type=zombie,tag=bloodkingfollower,limit=1] run function nightmare:monsters/bloodkingfollower
execute as @e[type=zombie,tag=bloodking,nbt={HurtTime:0s}] at @s if entity @p[distance=10..] run effect give @s speed 2 3
execute run bossbar set bloodking players @a
execute store result bossbar bloodking value run data get entity @e[tag=bloodking,limit=1] Health
execute as @e[tag=bloodking] at @s if entity @p[distance=..20] run bossbar set minecraft:bloodking visible true
execute as @e[tag=bloodking] at @s if entity @p[distance=20..] run bossbar set minecraft:bloodking visible false
execute unless entity @e[tag=bloodking] run bossbar set minecraft:bloodking visible false