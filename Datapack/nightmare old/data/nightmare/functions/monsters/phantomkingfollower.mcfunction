execute at @s if entity @e[tag=phantomking,distance=..10] run summon phantom ~ ~2 ~ {CustomNameVisible:1b,Tags:["phantomfollower:1b","nightmere:1b"],Passengers:[{id:"minecraft:skeleton",CustomNameVisible:1b,Tags:["phantomfollower","nightmere"],CustomName:'{"text":"Phantom King Follower","color":"dark_aqua"}',HandItems:[{id:"minecraft:bow",Count:1b},{}]}],CustomName:'{"text":"Phantom King Follower","color":"dark_aqua"}'}
execute at @s if entity @e[tag=phantomking,distance=..10] run tag @e[distance=..2,tag=!nightmere] add nightmere
execute at @s if entity @e[tag=phantomking,distance=..10] run tag @e[distance=..2,tag=nightmere] add phantomfollower
execute at @s if entity @e[tag=phantomking,distance=..10] run particle dust 0 0 1 5 ~ ~2 ~ 1 .6 1 0 50