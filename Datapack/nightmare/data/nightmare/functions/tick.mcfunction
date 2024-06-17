# Generated with MC-Build

#=================================================
# Check if custom mobs are enabled and if not then return
execute if score $overworld Nightmare_CustomMobs matches 1 run return 1
#=================================================
# Call Spawn functions
#=================================================
# No event overworld enemies
execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies
# No event nether enemies
execute if score $nether Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_nether_enemies
#=================================================
# Custom Crafting
#=================================================
# TODO: add crafting to own pack
function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check
#=================================================
# Items
#=================================================
# TODO: add items to own pack
execute as @a if score @s Nightmare_Item_use matches 1.. run function nightmare:items/check_items
# Entities
function nightmare:monsters/entities/snowball_damage/snowball_check
#<--------Summon circles-------->
# Handle circle timer
# function nightmare_particle:particles/summons/summoncirlce_vindicator
# function nightmare:development/testwitch
# function nightmare:development/witchhurtdetect