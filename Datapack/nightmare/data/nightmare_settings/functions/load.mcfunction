#Nightmare Difficulty Generated

scoreboard objectives add Nightmare_Settings_NetherSurvival dummy
scoreboard objectives add Nightmare_UseHealthSystem dummy
scoreboard objectives add Nightmare_Settings_PlayerSleepingProcentage dummy
scoreboard objectives add Nightmare_Settings_DisableInsomnia dummy
function nightmare_settings:welcome
execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_load
execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_load