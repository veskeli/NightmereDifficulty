#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add Nightmare_Mana dummy
scoreboard objectives add Nightmare_MaxMana dummy
scoreboard objectives add Nightmare_ManaRegneration dummy
scoreboard objectives add Nightmare_UseDelay dummy
execute run scoreboard players set $baseCooldown Nightmare_ManaRegneration 4
function nightmare:potions/setuppotions