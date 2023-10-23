#built using mc-build (https://github.com/mc-build/mc-build)

summon arrow ^ ^ ^0.5 {life:500,damage:1.2d,Tags:["arroweffect","player"],CustomName:'{"text":"Basic arrow Wand Projectile","color":"dark_blue"}'}
playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2
execute as @e[type=arrow,tag=player,tag=!motion] at @s rotated as @p run function nightmare:wands/upgradedbasicarrowwand/motion