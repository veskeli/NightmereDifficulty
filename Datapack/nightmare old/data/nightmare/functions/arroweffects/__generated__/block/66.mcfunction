#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s rotated ~ ~ run teleport @s @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1]
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 0 0 0 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 0.2 0.1 0.2 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 0.4 0.2 0.4 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 0.6000000000000001 0.30000000000000004 0.6000000000000001 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 0.8 0.4 0.8 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 1 0.5 1 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 1.2000000000000002 0.6000000000000001 1.2000000000000002 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 1.4000000000000001 0.7000000000000001 1.4000000000000001 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 1.6 0.8 1.6 0 15 normal
execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ 1.8 0.9 1.8 0 15 normal
kill @e[limit=1,type=arrow,sort=nearest,tag=teleportarrowplayer]