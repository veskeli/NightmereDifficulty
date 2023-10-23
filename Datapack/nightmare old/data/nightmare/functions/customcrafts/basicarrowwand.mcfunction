#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:basicarrowwand
advancement revoke @s only nightmare:basicarrowwand_adv
execute as @s run function nightmare:giveitem/basicarrowwand
clear @s minecraft:knowledge_book 1