#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 1 true
execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 1 true
execute at @s run particle firework ~ ~0.7 ~ 1 1 1 0.4 20 force