#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:torchwand
advancement revoke @s only nightmare:torchwand_adv
execute as @s run function nightmare:giveitem/torchwand
clear @s minecraft:knowledge_book 1