#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:weaknesscore
advancement revoke @s only nightmare:weaknesscore_adv
execute as @s run function nightmare:giveitem/weaknesscore
clear @s minecraft:knowledge_book 1