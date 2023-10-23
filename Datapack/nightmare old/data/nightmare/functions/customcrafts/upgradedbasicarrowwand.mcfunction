#built using mc-build (https://github.com/mc-build/mc-build)

recipe take @s nightmare:upgradedbasicarrowwand
advancement revoke @s only nightmare:upgradedbasicarrowwand_adv
execute as @s run function nightmare:giveitem/upgradedbasicarrowwand
clear @s minecraft:knowledge_book 1