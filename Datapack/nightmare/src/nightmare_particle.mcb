dir particles{
    #=================================================
    # MARK: Summons
    #=================================================
    dir summons{
        function summoncirlce_vindicator{
            #Summon vindicator if score lower then 1
            execute as @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run function nightmare:monsters/summons/summoncirlce_vindicator
            #Spread armorstand and then add tag (summon particle circle)
            execute at @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=50},name="SummonCircle_Vindicator"] run spreadplayers ~ ~ -0 4 false @e[type=minecraft:armor_stand,sort=nearest,limit=1]
            execute as @e[type=minecraft:armor_stand,scores={Nightmare_SummonCircle_Vindicator=50},name="SummonCircle_Vindicator"] run data merge entity @s {Tags:["SummonCircle_Vindicator"]}

            #Timer scoreboard
            scoreboard players remove @e[type=minecraft:armor_stand,tag=SummonCircle_Vindicator] Nightmare_SummonCircle_Vindicator 1
        }
    }
    #=================================================
    # MARK: Summon Schedules
    #=================================================
    dir summons_schedules{
        function summoncirlce_vindicator{
            #Spawn particles circle based on tag
            execute at @e[tag=SummonCircle_Vindicator] run function nightmare_particle:particles/summoncircle_vindicator
            #Timer schedule
            schedule function nightmare_particle:particles/summons_schedules/summoncirlce_vindicator 0.2s
        }
    }
    #=================================================
    # MARK: Effects
    #=================================================
    dir effects{
        function lava_cauldron_craft_success{
            particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 20 force
            playsound minecraft:entity.wither.shoot block @a ~ ~ ~
        }
        function lava_cauldron_craft_fail{
            execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100 force
            playsound minecraft:entity.wither.death block @a ~ ~ ~
        }
        function lava_cauldron_craft_start{
            execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100 force
            playsound minecraft:item.trident.return block @a ~ ~ ~
        }
    }
    #=================================================
    # MARK: Mob Schedules
    #=================================================
    dir mob_schedules{
        function speedboy_particle{
            #Spawn particles circle based on tag
            execute as @e[tag=nightmare_speedboy] at @s run particle soul_fire_flame ~ ~0.2 ~ .2 .1 .2 0 30 force
            #Timer schedule
            schedule function nightmare_particle:particles/mob_schedules/speedboy_particle 0.4s
        }
    }
}