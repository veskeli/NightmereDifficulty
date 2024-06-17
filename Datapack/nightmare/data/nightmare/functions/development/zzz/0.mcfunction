# Generated with MC-Build

# Set timer scoreboard
scoreboard players set @e[type=witch,tag=!nightmare,limit=1] Nightmare_WitchSummonTimer 3
# Add tag
data merge entity @s {Tags:["nightmare"]}
# Debug particle
execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100