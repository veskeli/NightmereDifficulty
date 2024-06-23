# Generated with MC-Build

# Summoner found!
say Summoner found!
# Summon 3 more zombified piglins
execute at @s run summon zombified_piglin ~ ~ ~ {Tags:["already_summoned"]}
execute at @s run summon zombified_piglin ~ ~ ~ {Tags:["already_summoned"]}
execute at @s run summon zombified_piglin ~ ~ ~ {Tags:["already_summoned"]}
# enable ai
data merge entity @s {NoAI:0b}
# remove tag
tag @s remove currently_summoning
# add tag already_summoned
tag @s add already_summoned
# play sound
playsound minecraft:item.trident.return block @a ~ ~ ~