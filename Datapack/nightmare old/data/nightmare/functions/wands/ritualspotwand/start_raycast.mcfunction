#built using mc-build (https://github.com/mc-build/mc-build)

say ded
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/ritualspotwand/raycast
tag @s remove raycasting
scoreboard players reset .distance steps