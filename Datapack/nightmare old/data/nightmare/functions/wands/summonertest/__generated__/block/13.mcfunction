#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set @s summonertest 30
data modify entity @s Owner set from entity @a[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{summonertest:1b}}}] UUID
tag @s add minion
tag @s add nightmare