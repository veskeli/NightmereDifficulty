#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[scores={potionofevoker=1..}] run tellraw @s {"text":"Already consumed!","color":"red"}
execute if entity @s[scores={potionofevoker=0}] run function nightmare:potions/__generated__/block/58