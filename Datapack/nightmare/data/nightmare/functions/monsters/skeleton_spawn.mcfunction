# Generated with MC-Build

# speedboy
execute if predicate nightmare:10change run execute as @e[type=skeleton,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:5,Name:"generic.attack_damage"},{Base:0.55,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare","nightmare_speedboy"], CustomName:'{"text":"Quickstep Skeleton"}'}
# shadowstalker
execute if predicate nightmare:2change run execute as @e[type=skeleton,tag=!nightmare,limit=1] run data merge entity @s {Silent:1b,CustomNameVisible:0b,CanPickUpLoot:0b,Tags:["nightmare","shadowstalker"],CustomName:'{"text":"Shadowstalker","color":"black"}',HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{display:{Name:'{"text":"Nightshade Blade","color":"black"}',Lore:['{"text":"Infused with the essence of the elusive Shadowstalkers","color":"dark_blue"}']},Enchantments:[{id:"minecraft:sharpness",lvl:6s}]}},{}],ArmorItems:[{id:"minecraft:netherite_boots",Count:1b,tag:{Trim:{material:"minecraft:lapis",pattern:"minecraft:raiser"}}},{id:"minecraft:netherite_leggings",Count:1b,tag:{Trim:{material:"minecraft:lapis",pattern:"minecraft:raiser"}}},{id:"minecraft:netherite_chestplate",Count:1b,tag:{Trim:{material:"minecraft:lapis",pattern:"minecraft:raiser"}}},{id:"minecraft:netherite_helmet",Count:1b,tag:{Trim:{material:"minecraft:lapis",pattern:"minecraft:raiser"}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.follow_range,Base:50},{Name:generic.knockback_resistance,Base:1.0},{Name:generic.movement_speed,Base:0.4},{Name:generic.attack_damage,Base:8}]}
# Melee skele
execute if predicate nightmare:10change run execute as @e[type=skeleton,tag=!nightmare,limit=1] run function nightmare:monsters/zzz/0
#=================================================
# Vanilla
execute as @e[type=skeleton,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9,Name:"generic.attack_damage"},{Base:0.31,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}