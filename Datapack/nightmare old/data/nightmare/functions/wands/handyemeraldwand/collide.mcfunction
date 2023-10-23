#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1000
execute if predicate nightmare:5change run function nightmare:wands/handyemeraldwand/__generated__/block/32
execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10