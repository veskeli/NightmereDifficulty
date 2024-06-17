# Generated with MC-Build

#clear recipes if nether survival is disabled
execute unless score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_settings:settings/recipes/nether_survival_recipes_take
#add recipes if nether survival is enabled
execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_settings:settings/recipes/nether_survival_recipes_give