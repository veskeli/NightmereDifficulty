#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=vindicator,tag=tntvin] at @s if entity @p[gamemode=survival,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
execute as @e[type=vindicator,tag=tntvin] at @s if entity @e[type=villager,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
execute as @e[type=vindicator,tag=tntvin] at @s if entity @e[type=iron_golem,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
execute as @e[type=vindicator,tag=nukevin] at @s if entity @p[gamemode=survival,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}
execute as @e[type=vindicator,tag=nukevin] at @s if entity @e[type=villager,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}
execute as @e[type=vindicator,tag=nukevin] at @s if entity @e[type=iron_golem,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}
execute as @e[type=ravager,tag=TNT] at @s if entity @p[gamemode=survival,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:10,CustomName:'{"text":"TNT ravager"}'}