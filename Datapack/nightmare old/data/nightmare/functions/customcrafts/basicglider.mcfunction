#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:basicglider
advancement revoke @s only nightmare:basicglider_adv
execute as @s run function nightmare:giveitem/basicglider
clear @s minecraft:knowledge_book 1