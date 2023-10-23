#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 6
execute if entity @s[scores={Nightmare_ManaRegneration=..4}] run function nightmare:wands/wandofpoison2/__generated__/block/46
scoreboard players set @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofpoison2/raycast
tag @s remove raycasting
scoreboard players reset .distance steps