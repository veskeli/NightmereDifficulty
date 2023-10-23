#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:basiccritcore
advancement revoke @s only nightmare:basiccritcore_adv
execute as @s run function nightmare:giveitem/basiccritcore
clear @s minecraft:knowledge_book 1