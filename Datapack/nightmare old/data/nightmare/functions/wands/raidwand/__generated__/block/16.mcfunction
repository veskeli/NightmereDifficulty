#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players remove @s Nightmare_Mana 4
execute if entity @s[scores={Nightmare_ManaRegneration=..4}] run function nightmare:wands/raidwand/__generated__/block/17
scoreboard players set @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
execute as @s if predicate nightmare:nether run scoreboard players add @s Nightmare_UseDelay 5
execute at @s run function nightmare:wands/raidwand/__generated__/block/18