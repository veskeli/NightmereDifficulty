# Generated with MC-Build

# Lower score
scoreboard players remove @e[type=zombified_piglin,tag=currently_summoning] Nightmare_ZombifiedPiglinSummonCircle 1
# if score is 0 or lower then summon
execute as @e[type=zombified_piglin,tag=currently_summoning,scores={Nightmare_ZombifiedPiglinSummonCircle=..0}] run function nightmare:monsters/zzz/4