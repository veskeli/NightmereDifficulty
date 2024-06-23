# Generated with MC-Build

schedule function nightmare:mob_spawns 0.1s replace
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