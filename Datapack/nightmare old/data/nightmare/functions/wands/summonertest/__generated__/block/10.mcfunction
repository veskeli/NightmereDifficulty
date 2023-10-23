#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players set @s Nightmare_ManaRegneration 1
scoreboard players remove @s Nightmare_Mana 1
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/summonertest/raycast
tag @s remove raycasting
scoreboard players reset .distance steps