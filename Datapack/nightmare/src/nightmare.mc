#built using mc-build (https://github.com/mc-build/mc-build) :D
import ./macros/datamergelib.mcm
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

    #Summon circle
    scoreboard objectives add Nightmare_SummonCircle_Vindicator dummy
    schedule function nightmare:particles/summons_schedules/summoncirlce_vindicator 0.2s

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

    !IF(config.dev)
    {
        #function nightmare:development/testwitch
        #function nightmare:development/witchhurtdetect
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