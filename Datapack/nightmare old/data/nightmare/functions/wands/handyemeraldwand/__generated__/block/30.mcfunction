#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 5
execute if entity @s[scores={Nightmare_ManaRegneration=..4}] run function nightmare:wands/handyemeraldwand/__generated__/block/31
scoreboard players set @s Nightmare_UseDelay 10
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 10
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 10
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/handyemeraldwand/raycast
tag @s remove raycasting
scoreboard players reset .distance steps