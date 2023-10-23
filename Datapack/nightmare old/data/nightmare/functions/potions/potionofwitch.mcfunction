#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @s[scores={potionofwitch=1..}] run tellraw @s {"text":"Already consumed!","color":"red"}
execute if entity @s[scores={potionofwitch=0}] run function nightmare:potions/__generated__/block/57