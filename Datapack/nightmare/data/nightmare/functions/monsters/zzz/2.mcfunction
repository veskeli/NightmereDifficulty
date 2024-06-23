# Generated with MC-Build

# disable ai
data merge entity @s {NoAI:1b}
# add tag
tag @s add currently_summoning
# summon display item for the summoning circle
execute at @s run summon armor_stand ~ ~ ~ {Tags:["summoncircle_entity"],NoGravity:1b,Invisible:1b,Invulnerable:1b,CustomName:'{"text":"Summoning Circle","color":"blue"}'}
# add score
scoreboard players set @e[type=armor_stand,sort=nearest,limit=1,tag=summoncircle_entity] Nightmare_ZombifiedPiglinSummonCircle 6
# add entity count
scoreboard players add $nether Nightmare_ZombifiedPiglinSummonCircle_Entities 1