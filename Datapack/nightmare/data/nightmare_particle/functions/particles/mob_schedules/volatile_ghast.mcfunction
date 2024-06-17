# Generated with MC-Build

# Spawn particles circle based on tag
execute as @e[tag=nightmare_volatile_ghast] at @s run particle minecraft:flame ~ ~0.2 ~ 1.5 1.5 1.5 0 100 force
# Timer schedule
schedule function nightmare_particle:particles/mob_schedules/volatile_ghast 1s replace