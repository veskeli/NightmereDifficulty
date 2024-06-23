# Generated with MC-Build

# clock zombified_piglin_summon_circle 1s{
#=================================================
# check all angered piglins for summoning circle
execute as @e[type=zombified_piglin,tag=!currently_summoning,nbt=!{AngerTime:0},limit=1] run function nightmare:monsters/zzz/1
#=================================================
# If no entities then return
execute unless score $nether Nightmare_ZombifiedPiglinSummonCircle_Entities matches 1.. run return 1
#=================================================
# check if summoning circle is active
execute as @e[type=armor_stand,tag=summoncircle_entity,limit=1] run function nightmare:monsters/zzz/3
execute as @e[type=armor_stand,tag=summoncircle_entity,limit=1] run say found summoning circle
execute as @e[type=armor_stand,tag=summoncircle_entity,scores={Nightmare_ZombifiedPiglinSummonCircle=..0},limit=1] run function nightmare:monsters/zzz/4