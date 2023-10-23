#built using mc-build (https://github.com/mc-build/mc-build)

summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:10,CustomName:'{"text":"Nuke"}'}
execute as @s run tag @e[distance=..1,limit=1,sort=nearest,type=creeper] add nightmare