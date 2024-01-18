
function load{
    execute run gamerule doImmediateRespawn false

    scoreboard objectives add Nightmare_Death deathCount
    scoreboard objectives add Nightmare_Health health
    scoreboard objectives add Nightmare_MaxHealth dummy
    scoreboard objectives add Nightmare_UseHealthSystem dummy
    scoreboard objectives add Nightmare_WaitingForRevive dummy

    scoreboard objectives add Nightmare_Testing dummy

    #revive bossbar
    bossbar add waiting_for_revive {"text":"Waiting for revive"}

    #Revive Timer
    scoreboard objectives add Nightmare_ReviveTimer dummy
    #Revive block Timer
    scoreboard objectives add Nightmare_DeathBlockTimer dummy

    #block loops
    scoreboard objectives add Nightmare_ReviveItemBlock dummy
    scoreboard players set $overworld Nightmare_UseHealthSystem 1

    #Reset health
    scoreboard objectives add Nightmare_GoldenAppleEat minecraft.used:minecraft.golden_apple
    scoreboard objectives add Nightmare_GoldenCarrotEat minecraft.used:minecraft.golden_carrot
    scoreboard objectives add Nightmare_HoneyBottleEat minecraft.used:minecraft.honey_bottle
    scoreboard objectives add Nightmare_AbsortionHearths dummy
    scoreboard objectives add Nightmare_AbsortionHearths_return dummy
    scoreboard objectives add Nightmare_AbsortionHearths_Dirty dummy
    scoreboard objectives add Nightmare_AbsortionHearths_Div dummy
    scoreboard objectives add Nightmare_AbsortionHearths_NewTest dummy
}
function custom_tick{
    #Handle death
    execute as @a[scores={Nightmare_Death=1..}] run function nightmare_healthsystem:handle_death
    execute as @a[scores={Nightmare_Death=3..,Nightmare_Health=1..}] run function nightmare_healthsystem:handle_after_death

    #Check revive
    function nightmare_healthsystem:revive/revive_tick

    #Show wait for revive bossbar
    bossbar set waiting_for_revive players @a[scores={Nightmare_WaitingForRevive=1}]

    #Timer
    scoreboard players add @e[type=item_display,tag=GraveInteractable] Nightmare_DeathBlockTimer 1
    execute as @e[type=item_display,tag=GraveInteractable,limit=1,scores={Nightmare_DeathBlockTimer=8000..}] run block{
        execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 50 normal
        #kill interaction
        kill @e[limit=1,type=interaction,sort=nearest,tag=GraveInteractable]
        #kill item display
        kill @e[limit=1,type=item_display,sort=nearest,tag=GraveInteractable]
    }

    #reset hp
    #Golden apple
    execute as @a[scores={Nightmare_GoldenAppleEat=1..}] run block{
        execute as @s if score @s Nightmare_MaxHealth matches 20.. run return 1
        execute as @s run attribute @s generic.max_health base set 20
        execute as @s run scoreboard players set @s Nightmare_MaxHealth 20
        execute at @s run particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 20 force
        execute at @s run playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~
        scoreboard players reset @s Nightmare_GoldenAppleEat
    }
    #Golden carrot
    execute as @a[scores={Nightmare_GoldenCarrotEat=1..}] run block{
        execute as @s if score @s Nightmare_MaxHealth matches 14.. run return 1
        execute as @s run attribute @s generic.max_health base set 14
        execute as @s run scoreboard players set @s Nightmare_MaxHealth 14
        execute at @s run particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 20 force
        execute at @s run playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~
        scoreboard players reset @s Nightmare_GoldenCarrotEat
    }
    function nightmare_healthsystem:temp_effects/custom_tick
}
function handle_death{
    execute as @s if score @s Nightmare_Death matches 1 run block{
        #Set spawnpoint to death location
        execute at @s run spawnpoint @s ~ ~ ~
        #Summon grave
        execute at @s run function nightmare_healthsystem:summon_grave
        #Set score
        scoreboard players set @s Nightmare_WaitingForRevive 1
        #Set player to spectator
        gamemode spectator @s
    }

    scoreboard players add @s Nightmare_Death 1
}
function summon_grave{
    execute at @s run summon item_display ~ ~1 ~ {CustomNameVisible:1b,billboard:"center",Tags:["ReviveBlockArea","GraveInteractable"],CustomName:'{"text":"Recent death"}',item:{id:"minecraft:nether_star",Count:1b}}
    execute as @e[type=minecraft:item_display,sort=nearest,limit=1] at @s positioned ~ ~-0.5 ~ summon interaction run data merge entity @s {width:1,height:1,response:1,Tags:[GraveInteractable]}
}
function handle_after_death{
    #Reset score
    scoreboard players reset @s Nightmare_Death
    #Do logic to handle after respawn

    #Set player to spectator
    gamemode spectator @s

    #Show title
    title @s times 20 100 20
    title @s title {"text":"Waiting for revive"}

    #sound
    #execute at @s run playsound minecraft:entity.wither.death block @s ~ ~ ~
}
function handle_revive_from_grave{
    advancement revoke @s only nightmare_healthsystem:death_point_interaction
    scoreboard players reset @s Nightmare_Item_Ray_Return

    #grave digger
    execute if entity @s[nbt={Inventory:[{id:"minecraft:wooden_shovel",tag:{grave_digger:1b}}]}] run block{
        #Remove grave digger
        clear @s wooden_shovel{grave_digger:1b} 1
        #update score (= Delete grave)
        scoreboard players set @s Nightmare_Item_Ray_Return 1

        #Summon revive
        execute as @e[type=item_display,sort=nearest,limit=1,tag=GraveInteractable] run function nightmare_healthsystem:revive/summon_grave_digger_item_display
    }

    execute if score @s Nightmare_Item_Ray_Return matches 1 run block{
        #kill item display
        kill @e[limit=1,type=item_display,sort=nearest,tag=GraveInteractable,distance=..30]
        #kill self (interaction)
        kill @e[limit=1,type=interaction,sort=nearest,tag=GraveInteractable,distance=..30]
    }
}
dir revive{
    function force_revive{
        scoreboard players reset @s Nightmare_WaitingForRevive
        gamemode survival @s
    }
    function summon_rottenheart_item_display{
        execute if score @s Nightmare_ReviveItemBlock matches 1 run return 1
        #Summon revive item
        execute at @s run summon item_display ~ ~1 ~ {CustomNameVisible:1b,billboard:"vertical",Tags:["rottenheart","WaitingForRevive"],CustomName:'{"text":"Revive in progress"}',item:{id:"minecraft:phantom_membrane",Count:1b}}
        #effect
        execute at @s run function nightmare_healthsystem:effects/revive_start
        #destory item
        kill @s
    }
    function summon_grave_digger_item_display{
        #Summon revive item
        execute at @s run summon item_display ~ ~ ~ {CustomNameVisible:1b,billboard:"vertical",Tags:["grave_digger","WaitingForRevive"],CustomName:'{"text":"Waiting for revive"}',item:{id:"minecraft:wooden_shovel",Count:1b}}
        #effect
        execute at @s run function nightmare_healthsystem:effects/revive_start
    }
    function handle_revive{
        tag @s add NoValidPlayer
        execute at @s if score @a[distance=..16,limit=1,sort=nearest] Nightmare_WaitingForRevive matches 1 run block{
            #Reset waiting for revive
            scoreboard players reset @p Nightmare_WaitingForRevive

            #Set gamemode
            gamemode survival @p
            #teleport to item
            execute at @s run teleport @p ~ ~ ~

            #Set health based on what revive used
            execute if entity @s[tag=rottenheart] run block{
                #Set health
                attribute @p generic.max_health base set 6
                execute as @p run scoreboard players set @s Nightmare_MaxHealth 6
                effect give @p instant_health 3 1 true
            }
            execute if entity @s[tag=grave_digger] run block{
                #Set health
                attribute @p generic.max_health base set 6
                execute as @p run scoreboard players set @s Nightmare_MaxHealth 6
                effect give @p instant_health 3 1 true
            }

            #particle
            execute at @s run function nightmare_healthsystem:effects/revive_success
            tag @s remove NoValidPlayer
        }
        #No valid player found
        execute as @s[tag=NoValidPlayer] run block{
            #summon item back
            execute if entity @s[tag=rottenheart] run block{
                execute at @s run function nightmare:items/summon_items/rottenheart
                execute at @s run scoreboard players set @e[limit=1,sort=nearest,nbt={Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{rottenhearth:1b}}}] Nightmare_ReviveItemBlock 1

                #effect
                execute at @s run function nightmare:particles/effects/lava_cauldron_craft_fail

                #kill revive
                kill @s
            }
        }
        #valid player found (usually just kill @s)
        execute as @s[tag=!NoValidPlayer] run block{
            kill @s
        }
    }
    function revive_tick{
        execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{rottenhearth:1b}}}] run function nightmare_healthsystem:revive/summon_rottenheart_item_display

        #if score/timer then craft
        execute as @e[type=item_display,tag=WaitingForRevive,limit=1,scores={Nightmare_ReviveTimer=50..}] run function nightmare_healthsystem:revive/handle_revive
        #Timer
        scoreboard players add @e[type=item_display,tag=WaitingForRevive] Nightmare_ReviveTimer 1
        #grave digger check
        execute as @e[type=item_display,tag=grave_digger,limit=1,scores={Nightmare_ReviveTimer=5..}] run function nightmare_healthsystem:revive/handle_revive
    }
}
dir effects{
    function revive_success{
        particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 20 force
        playsound minecraft:entity.arrow.hit_player block @a ~ ~ ~
    }
    function revive_start{
        playsound minecraft:item.trident.return block @a ~ ~ ~
    }
}
dir temp_effects{
    function custom_tick{
        execute as @a[scores={Nightmare_HoneyBottleEat=1..}] run block{
            scoreboard players reset @s Nightmare_HoneyBottleEat
            clear @s minecraft:glass_bottle 1
            scoreboard players add @s Nightmare_AbsortionHearths 1
            scoreboard players add @s Nightmare_AbsortionHearths_Dirty 1
            #effect clear @s absorption
            #effect give @s absorption infinite 0 true
        }

        execute as @a[scores={Nightmare_AbsortionHearths_Dirty=1..}] run function nightmare_healthsystem:temp_effects/check_real_absortion

    }
    function absortion_hearts_update{
        tellraw @s ["",{"text":"Set absortion to: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]

        #TODO add abs hearts
        execute as @s run effect clear @s absorption

        execute if score @s Nightmare_AbsortionHearths matches 1 run effect give @s absorption infinite 0 true
        execute if score @s Nightmare_AbsortionHearths matches 1 run damage @s 2
        execute if score @s Nightmare_AbsortionHearths matches 2 run effect give @s absorption infinite 0 true

        execute if score @s Nightmare_AbsortionHearths matches 3 run effect give @s absorption infinite 1 true
        execute if score @s Nightmare_AbsortionHearths matches 3 run damage @s 2
        execute if score @s Nightmare_AbsortionHearths matches 4 run effect give @s absorption infinite 1 true

        execute if score @s Nightmare_AbsortionHearths matches 5 run effect give @s absorption infinite 2 true
        execute if score @s Nightmare_AbsortionHearths matches 5 run damage @s 2
        execute if score @s Nightmare_AbsortionHearths matches 6 run effect give @s absorption infinite 2 true

        execute if score @s Nightmare_AbsortionHearths matches 7 run effect give @s absorption infinite 2 true
        execute if score @s Nightmare_AbsortionHearths matches 7 run damage @s 2
        execute if score @s Nightmare_AbsortionHearths matches 8 run effect give @s absorption infinite 2 true

        execute if score @s Nightmare_AbsortionHearths matches 9 run effect give @s absorption infinite 2 true
        execute if score @s Nightmare_AbsortionHearths matches 9 run damage @s 2
        execute if score @s Nightmare_AbsortionHearths matches 10 run effect give @s absorption infinite 2 true

        #LOOP(10,i){
            #execute if score @s Nightmare_AbsortionHearths matches <%i%> run effect give @s absorption infinite <%i%> true
        #}
    }

    function check_real_absortion{
        tellraw @s {"text":"\n "}
        tellraw @s ["",{"text":"New abs level return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]
        #Calulcate absortion heart amount currently
        execute as @s run scoreboard players set @s Nightmare_AbsortionHearths_return 0
        scoreboard players operation @s Nightmare_AbsortionHearths_return = @s Nightmare_Health
        #scoreboard players operation @s Nightmare_AbsortionHearths_return += @s Nightmare_AbsortionHearths
        scoreboard players operation @s Nightmare_AbsortionHearths_return -= @s Nightmare_MaxHealth
        #temp calc in abs hearts
        scoreboard players set @s Nightmare_AbsortionHearths_Div 2
        scoreboard players operation @s Nightmare_AbsortionHearths_return /= @s Nightmare_AbsortionHearths_Div
        #TODO Clear effect and check if not full hp and calculate real full heart amount

        tellraw @s ["",{"text":"Current level return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths_return"}}]


        execute if score @s Nightmare_AbsortionHearths matches 0.. run block{
            #If player already has absortion hearts remove them from adding
            execute if score @s Nightmare_AbsortionHearths_return matches 1.. run block{
                scoreboard players operation @s Nightmare_AbsortionHearths_NewTest = @s Nightmare_AbsortionHearths
                scoreboard players operation @s Nightmare_AbsortionHearths_NewTest -= @s Nightmare_AbsortionHearths_return
                execute if score @s Nightmare_AbsortionHearths_NewTest matches 0 run scoreboard players operation @s Nightmare_AbsortionHearths -= @s Nightmare_AbsortionHearths_return
            }

            tellraw @s ["",{"text":"Current return: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths_return"}},{"text":" And add hearts: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]

            #No negative numbers
            execute if score @s Nightmare_AbsortionHearths matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearths
            #Update hearts
            function nightmare_healthsystem:temp_effects/absortion_hearts_update
        }
        execute if score @s Nightmare_AbsortionHearths matches ..-1 run scoreboard players reset @s Nightmare_AbsortionHearths
        scoreboard players reset @s Nightmare_AbsortionHearths_Dirty
    }
}