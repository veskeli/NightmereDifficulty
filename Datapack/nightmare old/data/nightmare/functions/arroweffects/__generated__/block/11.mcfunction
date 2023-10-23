#built using mc-build (https://github.com/mc-build/mc-build)

tag @s add arroweffect
tag @s add teleportarrowplayer
scoreboard players operation @s teleportarrowowner = @a[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:bow",Count:1b,tag:{teleportbow:1b}}}] id