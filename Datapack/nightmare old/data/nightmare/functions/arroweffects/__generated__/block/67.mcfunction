#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add arroweffect
tag @s add teleportarrow
data merge entity @s {PierceLevel:1b}
scoreboard players operation @s teleportarrowowner = @e[distance=..6,sort=nearest,limit=1,tag=teleportskeleton] teleportskeletonarrowowner