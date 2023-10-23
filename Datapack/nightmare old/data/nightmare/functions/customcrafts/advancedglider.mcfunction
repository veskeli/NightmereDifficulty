#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:advancedglider
advancement revoke @s only nightmare:advancedglider_adv
execute as @s run function nightmare:giveitem/advancedglider
clear @s minecraft:knowledge_book 1