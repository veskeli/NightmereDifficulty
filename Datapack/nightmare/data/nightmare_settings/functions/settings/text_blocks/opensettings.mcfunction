# Generated with MC-Build

gamerule sendCommandFeedback false
#Header
tellraw @s [{"text": "\n"}]
tellraw @s [{"text": "\n"}]
tellraw @s [{"text": "\n"}]
tellraw @s [{"text":"=====","color":"yellow"},{"text":"Nightmare settings","bold":true,"color":"gold"},{"text":"=====","color":"yellow"}]
tellraw @s ["",{"text":"Recommended settings","italic":true,"color":"yellow"},{"text":" ["},{"text":"Apply","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_temporary/load_recommended_settings"}},{"text":"]"}]
#Only one player needs to sleep
execute unless score $overworld Nightmare_Settings_PlayerSleepingProcentage matches 1 run tellraw @s ["",{"text":"Only one player needs to sleep ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/player_sleeping_procentage_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_Settings_PlayerSleepingProcentage matches 1 run tellraw @s ["",{"text":"Only one player needs to sleep ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/player_sleeping_procentage_disable"}},{"text":"]"}]
#Disable insomnia (phantoms)
execute unless score $overworld Nightmare_Settings_DisableInsomnia matches 1 run tellraw @s ["",{"text":"Disable insomnia (phantoms) ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/disable_insomnia_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_Settings_DisableInsomnia matches 1 run tellraw @s ["",{"text":"Disable insomnia (phantoms) ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/disable_insomnia_disable"}},{"text":"]"}]
tellraw @s [{"text": "\n"}]
tellraw @s [{"text": "\n"}]
tellraw @s [{"text": "\n"}]
#tellraw @s [{"text": "\n"}]
#Custom mobs
execute unless score $overworld Nightmare_CustomMobs matches 1 run tellraw @s ["",{"text":"Block Custom mobs","color":"dark_green"},{"text":" ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/custom_mobs_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_CustomMobs matches 1 run tellraw @s ["",{"text":"Block Custom mobs","color":"dark_green"},{"text":" ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/custom_mobs_disable"}},{"text":"]"}]
tellraw @s {"text":"Systems:","color":"dark_aqua","bold":true}
#Health system
execute unless score $overworld Nightmare_UseHealthSystem matches 1 run tellraw @s ["",{"text":"Health system","color":"dark_green"},{"text":" ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/health_system_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_UseHealthSystem matches 1 run tellraw @s ["",{"text":"Health system","color":"dark_green"},{"text":" ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/health_system_disable"}},{"text":"]"}]
#equipment system
execute unless score $overworld Nightmare_UseEquipmentSystem matches 1 run tellraw @s ["",{"text":"(Alpha)","color":"yellow"},{"text":" Equipment system","color":"dark_green"},{"text":" ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/equipment_system_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_UseEquipmentSystem matches 1 run tellraw @s ["",{"text":"(Alpha)","color":"yellow"},{"text":" Equipment system","color":"dark_green"},{"text":" ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/equipment_system_disable"}},{"text":"]"}]
tellraw @s {"text":"Custom gamemodes:","color":"dark_aqua","bold":true}
#Nether only survival
execute unless score $overworld Nightmare_Settings_NetherSurvival matches 1 run tellraw @s ["",{"text":"Nether only survival","color":"red"},{"text":" ["},{"text":"Enable","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/nether_survival_enable"}},{"text":"]"}]
execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run tellraw @s ["",{"text":"Nether only survival","color":"red"},{"text":" ["},{"text":"Disable","color":"red","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_settings/nether_survival_disable"}},{"text":"]"}]
#Debug
tellraw @s {"text":"Debug:","color":"dark_aqua","bold":true}
tellraw @s ["",{"text":"Effect give glowing ["},{"text":"Apply","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_temporary/glowing_enable"}},{"text":"]"}]
tellraw @s ["",{"text":"Force revive ["},{"text":"Apply","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/apply_temporary/force_revive"}},{"text":"]"}]
schedule function nightmare_settings:settings/commandfeedback 1t replace