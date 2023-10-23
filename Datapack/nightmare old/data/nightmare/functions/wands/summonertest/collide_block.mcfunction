#built using mc-build (https://github.com/mc-build/mc-build)

execute at @s run particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
scoreboard players add .distance steps 1001
summon wolf ~ ~ ~ {CustomNameVisible:0b,DeathLootTable:"empty",Health:6f,Tags:["minion"],CustomName:'{"text":"Minion","color":"green"}',Attributes:[{Name:generic.max_health,Base:6},{Name:generic.attack_damage,Base:6}]}
execute as @e[type=wolf,sort=nearest,limit=1] run function nightmare:wands/summonertest/__generated__/block/13