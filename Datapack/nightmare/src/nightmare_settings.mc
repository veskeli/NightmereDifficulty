function load{
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
    execute as @a[tag=Nightmare_joined] run block{
        #tellraw @s {"text":"Profile loaded: ","extra":[{"selector":"@s"}]}
    }

    #nether survival
    execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_load
    #health system
    execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_load
    #equipment system
    execute if score $overworld Nightmare_UseEquipmentSystem matches 1 run function nightmare_equipment:custom_load
}
function tick{
    #<--------Join system-------->
    execute as @a[tag=!Nightmare_joined] run block{
        tag @s add Nightmare_joined
        #give all recipes on join
        recipe give @a *
        function nightmare_settings:settings/recipes/check_recipes
        #tellraw @s {"text":"Profile Created!"}
    }

    #nether survival
    execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_nether_survival:custom_tick

    #Health system
    execute if score $overworld Nightmare_UseHealthSystem matches 1 run function nightmare_healthsystem:custom_tick
    execute unless score $overworld Nightmare_UseHealthSystem matches 1 run block{
        execute as @a[scores={Nightmare_Death=1..}] run block{
            #Reset score
            scoreboard players reset @s Nightmare_Death
        }
    }
    #Equipment system
    execute if score $overworld Nightmare_UseEquipmentSystem matches 1 run function nightmare_equipment:custom_tick
}

clock 4s{
    function nightmare_settings:settings/recipes/check_recipes
}

function welcome{
    #Generate welcome message
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a ["",{"text":"Nightmare difficulty ","bold":true,"color":"gold"},{"text":"Settings:","bold":true}]
    tellraw @a ["",{"text":"["},{"text":"OpenSettings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare_settings:settings/text_blocks/opensettings"}},{"text":"]"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a [{"text": "\n"}]
    tellraw @a {"text":"Nightmare difficulty loaded!","bold":true,"color":"gold"}
    tellraw @a [{"text": "\n"}]
    tellraw @a ["",{"text":"Settings","color":"aqua"},{"text":" update"}]
    tellraw @a ["",{"text":"(Build "},{"text":"4","underlined":true,"color":"yellow"},{"text":")"}]
    tellraw @a [{"text": "\n"}]
}

dir settings{
    function opensettings_forall{
        execute as @a run function nightmare_settings:settings/text_blocks/opensettings
    }
    dir nether_survival{
        function enable_nether_survival{
            scoreboard players set @s Nightmare_Settings_NetherSurvival 1
        }
        function disable_nether_survival{
            scoreboard players set @s Nightmare_Settings_NetherSurvival 0
        }
    }
    dir text_blocks{
        function opensettings{
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
        }
    }
    dir apply_settings{
        #player sleeping procentage
        function player_sleeping_procentage_enable{
            scoreboard players add $overworld Nightmare_Settings_PlayerSleepingProcentage 1
            gamerule playersSleepingPercentage 1
            function nightmare_settings:settings/text_blocks/opensettings
        }
        function player_sleeping_procentage_disable{
            scoreboard players set $overworld Nightmare_Settings_PlayerSleepingProcentage 0
            gamerule playersSleepingPercentage 100
            function nightmare_settings:settings/text_blocks/opensettings
        }
        #disable insomnia
        function disable_insomnia_enable{
            scoreboard players set $overworld Nightmare_Settings_DisableInsomnia 1
            gamerule doInsomnia false
            function nightmare_settings:settings/text_blocks/opensettings
        }
        function disable_insomnia_disable{
            scoreboard players set $overworld Nightmare_Settings_DisableInsomnia 0
            gamerule doInsomnia true
            function nightmare_settings:settings/text_blocks/opensettings
        }
        #custom mobs
        function custom_mobs_enable{
            scoreboard players set $overworld Nightmare_CustomMobs 1
            function nightmare_settings:settings/text_blocks/opensettings
        }
        function custom_mobs_disable{
            scoreboard players set $overworld Nightmare_CustomMobs 0
            function nightmare_settings:settings/text_blocks/opensettings
        }
        #nether survival
        function nether_survival_enable{
            scoreboard players set $overworld Nightmare_Settings_NetherSurvival 1
            function nightmare_settings:settings/text_blocks/opensettings
            #Remeber to load if enabled
            function nightmare_nether_survival:custom_load
            #add recipes
            function nightmare_settings:settings/recipes/nether_survival_recipes_give
        }
        function nether_survival_disable{
            scoreboard players set $overworld Nightmare_Settings_NetherSurvival 0
            function nightmare_settings:settings/text_blocks/opensettings
            #remove recipes
            function nightmare_settings:settings/recipes/nether_survival_recipes_take
        }
        #health system
        function health_system_enable{
            scoreboard players set $overworld Nightmare_UseHealthSystem 1
            function nightmare_settings:settings/text_blocks/opensettings
            #Remeber to load if enabled
            function nightmare_healthsystem:custom_load
        }
        function health_system_disable{
            scoreboard players set $overworld Nightmare_UseHealthSystem 0
            function nightmare_settings:settings/text_blocks/opensettings
        }
        #equipment system
        function equipment_system_enable{
            scoreboard players set $overworld Nightmare_UseEquipmentSystem 1
            function nightmare_settings:settings/text_blocks/opensettings
            #remeber to load if enabled
            function nightmare_equipment:custom_load
        }
        function equipment_system_disable{
            scoreboard players set $overworld Nightmare_UseEquipmentSystem 0
            function nightmare_settings:settings/text_blocks/opensettings
        }
    }
    dir apply_temporary{
        function glowing_enable{
            effect give @e minecraft:glowing 5 0
            function nightmare_settings:settings/text_blocks/opensettings
        }
        function force_revive{
            title @s actionbar {"text":"Force revived"}
            function nightmare_healthsystem:revive/force_revive
            function nightmare_settings:settings/text_blocks/opensettings
        }
        function load_recommended_settings{
            #settings
            function nightmare_settings:settings/apply_settings/player_sleeping_procentage_enable
            function nightmare_settings:settings/apply_settings/disable_insomnia_enable
            function nightmare_settings:settings/apply_settings/health_system_enable
            #settings text
            function nightmare_settings:settings/text_blocks/opensettings
        }
    }
    dir recipes{
        function check_recipes{
            #clear recipes if nether survival is disabled
            execute unless score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_settings:settings/recipes/nether_survival_recipes_take
            #add recipes if nether survival is enabled
            execute if score $overworld Nightmare_Settings_NetherSurvival matches 1 run function nightmare_settings:settings/recipes/nether_survival_recipes_give
        }
        function nether_survival_recipes_take{
            recipe take @a nightmare_nether_survival:create_belt_twisting
            recipe take @a nightmare_nether_survival:create_belt_weeping
            recipe take @a nightmare_nether_survival:grave_digger
            recipe take @a nightmare_nether_survival:honey_bottle
            recipe take @a nightmare_nether_survival:honey_bottle_f
            recipe take @a nightmare_nether_survival:iron_sheet
            recipe take @a nightmare_nether_survival:paper_from_twisting
            recipe take @a nightmare_nether_survival:paper_from_weeping
            recipe take @a nightmare_nether_survival:redstone_from_nether
            recipe take @a nightmare_nether_survival:slime_from_magmasline
            recipe take @a nightmare_nether_survival:spout_twisting
            recipe take @a nightmare_nether_survival:torch_from_charge
        }
        function nether_survival_recipes_give{
            recipe give @a nightmare_nether_survival:create_belt_twisting
            recipe give @a nightmare_nether_survival:create_belt_weeping
            recipe give @a nightmare_nether_survival:grave_digger
            recipe give @a nightmare_nether_survival:honey_bottle
            recipe give @a nightmare_nether_survival:honey_bottle_f
            recipe give @a nightmare_nether_survival:iron_sheet
            recipe give @a nightmare_nether_survival:paper_from_twisting
            recipe give @a nightmare_nether_survival:paper_from_weeping
            recipe give @a nightmare_nether_survival:redstone_from_nether
            recipe give @a nightmare_nether_survival:slime_from_magmasline
            recipe give @a nightmare_nether_survival:spout_twisting
            recipe give @a nightmare_nether_survival:torch_from_charge
        }
    }
    function commandfeedback{
        gamerule sendCommandFeedback true
    }
}