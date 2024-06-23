# Generated with MC-Build

# Return if no summoner found
execute unless entity @e[type=zombified_piglin,tag=currently_summoning,limit=1,sort=nearest,distance=..2] run say No summoner found!
execute unless entity @e[type=zombified_piglin,tag=currently_summoning,limit=1,sort=nearest,distance=..2] run return 1
execute as @e[type=zombified_piglin,tag=currently_summoning,limit=1,sort=nearest,distance=..2] run function nightmare:monsters/zzz/5
# kill display item
kill @s
# remove entity count
scoreboard players remove $nether Nightmare_ZombifiedPiglinSummonCircle_Entities 1
say 5