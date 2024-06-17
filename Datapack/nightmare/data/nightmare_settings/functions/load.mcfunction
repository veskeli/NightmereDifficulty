# Generated with MC-Build

#custom mobs
scoreboard objectives add Nightmare_CustomMobs dummy
#nether survival
scoreboard objectives add Nightmare_Settings_NetherSurvival dummy
#health system
scoreboard objectives add Nightmare_UseHealthSystem dummy
#equipment system
scoreboard objectives add Nightmare_UseEquipmentSystem dummy
#settings
scoreboard objectives add Nightmare_Settings_PlayerSleepingProcentage dummy
scoreboard objectives add Nightmare_Settings_DisableInsomnia dummy
#welcome message
function nightmare_settings:welcome
#Load forced settings
gamerule doLimitedCrafting true
#<--------Show join text-------->
execute as @a[tag=Nightmare_joined] run function nightmare_settings:zzz/0
#nether survival
execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_load
#health system
execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_load
#equipment system
execute if score $overworld Nightmare_UseEquipmentSystem matches 1 run function nightmare_equipment:custom_load