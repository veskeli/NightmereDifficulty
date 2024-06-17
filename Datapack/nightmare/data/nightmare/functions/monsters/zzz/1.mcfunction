# Generated with MC-Build

# if already summoned then return
execute if entity @s[tag=already_summoned] run return 1
# start summoning
execute if predicate nightmare:10change run function nightmare:monsters/zzz/2
# 10% chance to never summon
execute if predicate nightmare:2change run tag @s add already_summoned