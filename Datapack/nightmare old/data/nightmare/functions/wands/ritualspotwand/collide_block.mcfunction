#built using mc-build (https://github.com/mc-build/mc-build)

clear @a[limit=1,sort=nearest] warped_fungus_on_a_stick{ritualspotwand:1b} 1
execute positioned ~ ~1 ~ align xyz run summon armor_stand ~.05 ~ ~ {Tags:["ritualspot"],Invisible:1}
execute at @s run particle dust 1 0 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10