# Generated with MC-Build

# disable ai
data merge entity @s {NoAI:1b}
# add tag
tag @s add currently_summoning
# summon display item for the summoning circle
execute at @s run summon armor_stand ~ ~ ~ {Tags:["summoncircle_entity"],NoGravity:1b,Invisible:1b,Invulnerable:1b}
# add score
scoreboard players set @s Nightmare_ZombifiedPiglinSummonCircle 6