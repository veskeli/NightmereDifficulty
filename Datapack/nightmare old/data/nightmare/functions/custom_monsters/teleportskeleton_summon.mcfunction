#built using mc-build (https://github.com/mc-build/mc-build)

data merge entity @s {CustomNameVisible:0b,Tags:["nightmare","teleportskeleton"],CustomName:'{"text":"Skeleton thief"}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Enderman bow","color":"dark_blue","italic":false}',Lore:['{"text":"End guardian\'s secret prototype weapon","color":"dark_blue"}']},RepairCost:100,Damage:0.1-0.8,teleportbow:1b}},{}]}
tag @s add teleportskeleton
tag @s add nightmare
scoreboard players add @s teleportskeletonarrowowner 0
execute as @s[scores={teleportskeletonarrowowner=0}] run function nightmare:idsystem/teleportskeletoninit