#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1
execute unless entity @s[distance=..3] run particle dust 0.506 0.314 0.129 1 ~ ~ ~ 0 0 0 0 1
execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/ritualspotwand/raycast
execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/ritualspotwand/collide_block