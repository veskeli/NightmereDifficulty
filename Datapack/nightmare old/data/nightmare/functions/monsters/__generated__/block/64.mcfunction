#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add nightmare
data merge entity @s {NoGravity:1b,Silent:1b,DeathLootTable:"empty",ActiveEffects:[{Id:14,Amplifier:1b,Duration:10,ShowParticles:0b}]}
teleport @s ~ ~300 ~
kill @s
summon illusioner ~ ~ ~
tag @e[type=illusioner,distance=..2,sort=nearest,limit=1] add nightmare