#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 4
execute if entity @s[scores={Nightmare_ManaRegneration=..4}] run function nightmare:wands/basicarrowwand/__generated__/block/20
scoreboard players set @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
execute if predicate nightmare:50change run clear @s arrow 1
execute as @s anchored eyes positioned ^ ^ ^ run function nightmare:wands/basicarrowwand/raycast