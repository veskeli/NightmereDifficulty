#Nightmare Difficulty Generated

execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_tick
execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_tick
execute unless score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_settings:__generated__/block/0