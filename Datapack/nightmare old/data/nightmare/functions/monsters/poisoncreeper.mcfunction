execute as @s[tag=!nightmare] run data merge entity @s {Tags:["nightmare","poisoncreeper"],Attributes:[{Name:"generic.movement_speed",Base:0.24}],ExplosionRadius:0,Fuse:10}
execute as @s run effect give @s minecraft:unluck 999999 16 true