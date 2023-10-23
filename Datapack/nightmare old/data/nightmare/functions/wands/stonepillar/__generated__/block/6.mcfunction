#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 10
execute if entity @s[scores={Nightmare_ManaRegneration=..4}] run function nightmare:wands/stonepillar/__generated__/block/7
scoreboard players set @s Nightmare_UseDelay 10
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 10
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 10
tag @s add raycasting
execute run function nightmare:wands/stonepillar/raycast
tag @s remove raycasting
scoreboard objectives add PillarWand dummy