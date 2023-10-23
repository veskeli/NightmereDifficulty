#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:wandbook
advancement revoke @s only nightmare:wandbook_adv
execute as @s run function nightmare:giveitem/wandbook
clear @s minecraft:knowledge_book 1