#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:poisoncore
advancement revoke @s only nightmare:poisoncore_adv
execute as @s run function nightmare:giveitem/poisoncore
clear @s minecraft:knowledge_book 1