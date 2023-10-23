#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=phantomking] run tag @s add phantomking
execute as @e[type=minecraft:arrow,tag=phantomking] run tag @s add arroweffect
execute as @e[type=arrow,tag=phantomking] at @s run particle soul_fire_flame ~ ~ ~
execute if predicate nightmare:50change as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] run function nightmare:monsters/phantomkingfollower
execute as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 100
execute as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] run kill @s