#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=fireball,tag=!nightmare,limit=1] at @s if entity @e[type=ghast,distance=..5,sort=nearest,limit=1,tag=shotgun] run function nightmare:monsters/__generated__/block/59
data merge entity @e[type=fireball,tag=!nightmare,limit=1] {ExplosionPower:3,Tags:["nightmare"]}
tag @e[type=fireball,tag=!nightmare] add nightmare
execute if predicate nightmare:50change run tag @e[type=ghast,tag=!nightmare,limit=1] add shotgun
tag @e[type=ghast,tag=!nightmare] add nightmare