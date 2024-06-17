# Generated with MC-Build

# Dont remove or edit ------------->
scoreboard objectives add Nightmare_INTERNAL dummy
execute run gamerule commandBlockOutput false
# Dont remove or edit <-------------
#=================================================
# Scoreboards
#=================================================
# Difficulty level
scoreboard objectives add Nightmare_Difficulty dummy
# Current events
scoreboard objectives add Nightmare_currentevent dummy
scoreboard players add $overworld Nightmare_currentevent 0
scoreboard players add $nether Nightmare_currentevent 0
# Summon circle
scoreboard objectives add Nightmare_SummonCircle_Vindicator dummy
schedule function nightmare_particle:particles/summons_schedules/summoncirlce_vindicator 0.2s replace
# lava_cauldron craft
scoreboard objectives add Nightmare_FloorCraft_RottenHeartCooldown dummy
# Witch test
scoreboard objectives add Nightmare_WitchSummonTimer dummy
scoreboard objectives add Nightmare_WitchHealth dummy
# Items
scoreboard objectives add Nightmare_Item_use minecraft.used:warped_fungus_on_a_stick
scoreboard objectives add Nightmare_Item_Ray_steps dummy
scoreboard objectives add Nightmare_Item_Ray_Return dummy
# Snowball
scoreboard objectives add Nightmare_snowballs_used minecraft.used:minecraft.snowball
# Mob Summons
scoreboard objectives add Nightmare_ZombifiedPiglinSummonCircle dummy
# Custom
scoreboard objectives add DeathCount deathCount
#=================================================
# Schedule functions
#=================================================
schedule function nightmare:development/schedule_witchsummon 1s replace
#=================================================
# Start particle schedules
function nightmare_particle:particles/start_particle_schedules