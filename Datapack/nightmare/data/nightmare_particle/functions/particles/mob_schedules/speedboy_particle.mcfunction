# Generated with MC-Build

# Spawn particles circle based on tag
execute as @e[tag=nightmare_speedboy] at @s run particle soul_fire_flame ~ ~0.2 ~ .2 .1 .2 0 30 force
# Timer schedule
schedule function nightmare_particle:particles/mob_schedules/speedboy_particle 0.4s replace