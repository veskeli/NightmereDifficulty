#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1
execute unless entity @s[distance=..1] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
execute if score .distance steps matches ..50 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/summonertest/raycast
execute if score .distance steps matches ..50 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/summonertest/collide_block
execute if score .distance steps matches 51 run function nightmare:wands/summonertest/__generated__/block/11