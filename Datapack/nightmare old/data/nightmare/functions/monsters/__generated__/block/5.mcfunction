#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add shotgun
execute rotated as @s run execute positioned 0. 0 0. run summon fireball ^ ^ ^.1 {Tags:["fireball"]}
execute as @e[tag=fireball,sort=nearest] run data modify entity @s power set from entity @s Pos
tp @e[tag=fireball,sort=nearest] ~3 ~1 ~
tag @e[tag=fireball,sort=nearest] add shotgun
tag @e[tag=fireball,sort=nearest] remove fireball
execute rotated as @s run execute positioned 0. 0 0. run summon fireball ^ ^ ^.1 {Tags:["fireball"]}
execute as @e[tag=fireball,sort=nearest] run data modify entity @s power set from entity @s Pos
tp @e[tag=fireball,sort=nearest] ~-3 ~-1 ~
tag @e[tag=fireball,sort=nearest] add shotgun
tag @e[tag=fireball,sort=nearest] remove fireball