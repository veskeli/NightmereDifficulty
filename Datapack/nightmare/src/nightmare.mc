#built using mc-build (https://github.com/mc-build/mc-build) :D
import ./macros/datamergelib.mcm
import ./macros/wands.mcm
function nightmareversion{
    tellraw @s ["",{"text":"Nightmare","bold":true,"color":"red"},{"text":" Build: "},{"text":"1","underlined":true,"color":"yellow"},{"text":"\n"},{"text":"Rewrite","color":"aqua"},{"text":" update"}]
}

function nightmareloaded{
    tellraw @a {"text":"\n "}
    tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
    tellraw @a {"text":"\n "}
}

#//////////////////////////////////[load]//////////////////////////////////
function load{
    #Dont remove or edit ------------->
    scoreboard objectives add Nightmare_INTERNAL dummy
    execute run gamerule commandBlockOutput false

    #Loaded Text
    execute as @a run function nightmare:nightmareloaded

    #Version Text
    execute as @a run function nightmare:nightmareversion
    #Dont remove or edit <-------------

    #<--------Scoreboards-------->
    #Current events
    scoreboard objectives add Nightmare_currentevent dummy
    scoreboard players add $overworld Nightmare_currentevent 0

    #Wands
    scoreboard objectives add Nightmare_Wanduse minecraft.used:warped_fungus_on_a_stick
    scoreboard objectives add Nightmare_Wand_steps dummy

    #Summon circle
    scoreboard objectives add Nightmare_SummonCircle_Vindicator dummy
    schedule function nightmare:particles/summons_schedules/summoncirlce_vindicator 0.2s

    #lava_cauldron craft
    scoreboard objectives add Nightmare_FloorCraft_RottenHeartCooldown dummy

    #Witch test
    scoreboard objectives add Nightmare_WitchSummonTimer dummy
    scoreboard objectives add Nightmare_WitchHealth dummy
    schedule function nightmare:development/schedule_witchsummon 1s

    #<--------Show join text-------->
    execute as @a[tag=Nightmare_joined] run block{
        tellraw @s {"text":"Profile loaded!"}
    }

    !IF(config.dev)
    {
        tellraw @a {"text":"\n "}
        tellraw @a {"text":"Testing Build!","color":"red"}
        tellraw @a {"text":"\n "}
    }
}

#//////////////////////////////////[Tick]//////////////////////////////////
function tick{
    #<--------Join system-------->
    execute as @a[tag=!Nightmare_joined] run block{
        tag @s add Nightmare_joined
        tellraw @s {"text":"Profile Created!"}
    }

    #<--------No event overworld enemies-------->
    execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies

    #<--------Summon circles-------->
    #Handle circle timer
    function nightmare:particles/summons/summoncirlce_vindicator

    #<--------Custom Crafting-------->
    function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
    function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check

    !IF(config.dev)
    {
        #function nightmare:development/testwitch
        #function nightmare:development/witchhurtdetect
        execute as @a if score @s Nightmare_Wanduse matches 1.. run function nightmare:magic/wands/checkwand
    }
}

function commandfeedback{
    gamerule sendCommandFeedback true
}

dir monsters{
    #//////////////////////////////////[No event overwold enemies]//////////////////////////////////
    function no_event_overworld_enemies{

    #<--------Creeper-------->
    function nightmare:monsters/creeper_spawn

    #<----------------Zombies---------------->
    #Zombie
    function nightmare:monsters/zombie_spawn
    #Husk
    function nightmare:monsters/husk_spawn
    #VillagerZombie
    function nightmare:monsters/villagerzombie_spawn
    #Drowned
    function nightmare:monsters/drowned_spawn

    #<--------Skeleton-------->
    function nightmare:monsters/skeleton_spawn

    #<--------Spider-------->
    function nightmare:monsters/spider_spawn
    }

    #//////////////////////////////////[Zombies]//////////////////////////////////
    function zombie_spawn{
        #Strong and speedboy
        #execute if predicate nightmare:25change run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalzombie
        #Rain zombie
        #execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}

        #<--------Vanilla Zombie-------->
        data_damage_speed zombie 9 0.3
    }
    function husk_spawn{
        #<--------Vanilla Husk-------->
        data_damage_speed husk 9 0.3
    }
    function villagerzombie_spawn{
        data merge entity @e[type=zombie_villager,tag=!nightmare,limit=1] {Health:30f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.28d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}
    }
    function drowned_spawn{
        #execute if predicate nightmare:speedboy run data merge entity @e[type=drowned,tag=!nightmare,limit=1] {Attributes:[{Base:5.0d,Name:"generic.attack_damage"},{Base:0.6d,Name:"generic.movement_speed"}],IsBaby:0b,CanPickUpLoot:1b,Tags:["nightmare"],CustomName:'{"text":"Speed boy"}',Name:zombie.spawn_reinforcements,Base:1}
        data merge entity @e[type=drowned,tag=!nightmare,limit=1] {Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}
    }
    #//////////////////////////////////[Skeleton]//////////////////////////////////
    function skeleton_spawn{
        #<--------Vanilla Skeleton-------->
        data_damage_speed skeleton 9 0.3
    }
    #//////////////////////////////////[Spider]//////////////////////////////////
    function spider_spawn{
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:8f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Attributes:[{Base:3.0d,Name:"generic.attack_damage"},{Base:0.7d,Name:"generic.movement_speed"}],Tags:["nightmare","speedboy"]}
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:20f,Attributes:[{Base:4.0d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        data_damage_speed spider 6 0.42
    }
    #//////////////////////////////////[Creeper]//////////////////////////////////
    function creeper_spawn{
        data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}
    }
    #//////////////////////////////////[Summons]//////////////////////////////////
    dir summons{
        function summoncirlce_vindicator{
            #Summon vindicator
            execute at @s run summon minecraft:vindicator ~ ~ ~ {CustomName:"\"Summoned vindicator\"",CustomNameVisible:0b}
            #Spawn particle
            execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100
            #kill executing entity (Should be armorstand)
            kill @s
        }
    }
}
dir custom_crafting{
    dir lava_cauldron{
        function rottenhearth_craft_check{
            execute as @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh",Count:16b}}] at @s if block ~ ~-1 ~ lava_cauldron at @s run block{
                #Summon armor stand (handles crafting check)
                summon armor_stand ~ ~ ~ {Tags:[rottenhearth],Invulnerable:1b,NoGravity:1b,Invisible:1b}
                #Center armor stand
                execute at @s align xyz run tp @e[type=armor_stand,tag=rottenhearth,sort=nearest,limit=1] ~.5 ~.5 ~.5

                #Show particles
                execute at @s run function nightmare:particles/effects/lava_cauldron_craft_start
                #Destroy craft items (rotten flesh)
                kill @s
            }
        }
        function rottenhearth_craft{
            #Summon item
            execute at @s if block ~ ~-1 ~ lava_cauldron run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Rotten hearth","italic":false,"color":"dark_purple"}]',Lore:['[{"text":"Revive player with 1 hearth","italic":false,"color":"yellow"}]']},rottenhearth:1b}}}
            #show particle success
            execute at @s if block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_success

            #If lava cauldron not found show fail particle
            execute at @s unless block ~ ~-1 ~ lava_cauldron run function nightmare:particles/effects/lava_cauldron_craft_fail

            #Empty lava cauldron
            execute at @s if block ~ ~-1 ~ lava_cauldron run setblock ~ ~-1 ~ cauldron

            #Kill executer == Armor stand
            kill @s
        }
        function rottenhearth_armor_stand_check{
            #if score/timer then craft
            execute as @e[type=armor_stand,tag=rottenhearth,limit=1,scores={Nightmare_FloorCraft_RottenHeartCooldown=50..}] run function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft
            #Timer
            scoreboard players add @e[type=armor_stand,tag=rottenhearth] Nightmare_FloorCraft_RottenHeartCooldown 1
        }
    }
}
dir particles{
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
    dir summons_schedules{
        function summoncirlce_vindicator{
            #Spawn particles circle based on tag
            execute at @e[tag=SummonCircle_Vindicator] run function nightmare:particles/summoncircle_vindicator
            #Timer schedule
            schedule function nightmare:particles/summons_schedules/summoncirlce_vindicator 0.2s
        }
    }
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
}
!IF(config.dev)
{
    dir development{
        function summonarmorstand{
            #Spawn armorstand with summon settings
            summon minecraft:armor_stand ~ ~1 ~ {CustomName:'{"text":"SummonCircle_Vindicator"}',Invisible:1b,Invulnerable:1b}
            #set scoreboar timer
            scoreboard players set @e[type=minecraft:armor_stand,name="SummonCircle_Vindicator",limit=1,sort=nearest] Nightmare_SummonCircle_Vindicator 50
        }
        function testwitch{
            execute as @e[type=witch,tag=!nightmare,limit=1] run block{
                #Set timer scoreboard
                scoreboard players set @e[type=witch,tag=!nightmare,limit=1] Nightmare_WitchSummonTimer 3
                #Add tag
                data merge entity @s {Tags:["nightmare"]}
                #Debug particle
                execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100
            }
        }
        function schedule_witchsummon{
            #Spawn Summoning circle
            execute at @e[type=witch,tag=nightmare,scores={Nightmare_WitchSummonTimer=1}] run function nightmare:development/summonarmorstand
            execute as @e[type=witch,tag=nightmare,scores={Nightmare_WitchSummonTimer=1}] run scoreboard players set @s Nightmare_WitchSummonTimer 5

            #Timer scoreboard
            scoreboard players remove @e[type=witch,tag=nightmare] Nightmare_WitchSummonTimer 1
            schedule function nightmare:development/schedule_witchsummon 1s
        }
        function witchhurtdetect{
            execute at @e[tag=SummonCircle_Vindicator] run execute as @e[type=witch,nbt={HurtTime:10s},distance=..10] run block{
                execute at @e[distance=..10,type=armor_stand,tag=SummonCircle_Vindicator] run block{
                        function nightmare:particles/summoncircle_vindicator_blocked
                        execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100
                    }
                execute as @e[distance=..10,type=armor_stand,tag=SummonCircle_Vindicator] run kill @s
            }
        }
    }
}
dir magic{
    dir wands{
        function checkwand{
            scoreboard players reset @s Nightmare_Wanduse

            #execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] at @s run handle_wand_start_raycast emeraldwand
            execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] at @s run function nightmare:magic/wands/emeraldwand/start_raycast
        }
        dir emeraldwand{
            function start_raycast{
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:magic/wands/emeraldwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance Nightmare_Wand_steps
            }
            function raycast{
                execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:magic/wands/emeraldwand/collide
                scoreboard players add .distance Nightmare_Wand_steps 1

                execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

                execute if score .distance Nightmare_Wand_steps matches ..700 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:magic/wands/emeraldwand/raycast
                #execute if score .distance Nightmare_Wand_steps matches ..700 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
                execute if score .distance Nightmare_Wand_steps matches ..700 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run teleport @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] ~ ~1 ~
            }
            function collide{
                scoreboard players add .distance Nightmare_Wand_steps 700
                #damage @s 4 magic by @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}]
                ride @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] mount @s
                playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
                execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
            }
        }
    }
}