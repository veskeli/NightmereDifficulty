#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:bow",Count:1b,tag:{teleportbow:1b}}}] run function nightmare:arroweffects/__generated__/block/65
execute as @a if score @s id = @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] teleportarrowowner run function nightmare:arroweffects/__generated__/block/66
execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[distance=..6,sort=nearest,limit=1,tag=teleportskeleton] run function nightmare:arroweffects/__generated__/block/67
execute as @e[type=skeleton] if score @s teleportskeletonarrowowner = @e[tag=teleportarrow,nbt={inGround:1b},limit=1] teleportarrowowner run function nightmare:arroweffects/__generated__/block/68