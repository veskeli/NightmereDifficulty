#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:basicwand
advancement revoke @s only nightmare:basicwand_adv
execute as @s run function nightmare:giveitem/basicwand
clear @s minecraft:knowledge_book 1