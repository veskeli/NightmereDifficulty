# Generated with MC-Build

#<--------Join system-------->
execute as @a[tag=!Nightmare_joined] run function nightmare_settings:zzz/1
#nether survival
execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_tick
#Health system
execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_tick
execute unless score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_settings:zzz/2
#Equipment system
execute if score $overworld Nightmare_UseEquipmentSystem matches 1 run function nightmare_equipment:custom_tick