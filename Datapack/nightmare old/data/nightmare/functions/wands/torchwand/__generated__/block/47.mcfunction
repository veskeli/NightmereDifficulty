#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 1
execute if entity @s[scores={Nightmare_ManaRegneration=..1}] run function nightmare:wands/torchwand/__generated__/block/48
scoreboard players set @s Nightmare_UseDelay 1
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 1
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 1
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/torchwand/raycast
tag @s remove raycasting
scoreboard players reset .distance steps