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
    scoreboard objectives add currentevent dummy
    scoreboard players add $overworld currentevent 0

    #Summon circle
    scoreboard objectives add SummonCircle_Vindicator dummy

    #<--------Show join text-------->
    execute as @a[tag=Nightmare_joined] run block{
        tellraw @s {"text":"Profile loaded!"}
    }

    !IF(config.dev)
    {
        say test 6
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
    execute if score $overworld currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies

    #<--------Summon circles-------->
    function nightmare:particles/summons/summoncirlce_vindicator
    execute at @e[tag=SummonCircle_Vindicator] run function nightmare:particles/summoncircle_vindicator
}

function commandfeedback{
    gamerule sendCommandFeedback true
}

dir monsters{
    #//////////////////////////////////[No event overwold enemies]//////////////////////////////////
    function no_event_overworld_enemies{
    #creeper
    #function nightmare:monsters/creeper_spawn

    #<--------Zombie-------->
    function nightmare:monsters/zombie_spawn

    #VillagerZombie
    #function nightmare:monsters/villagerzombie_spawn

    #Drowned
    #function nightmare:monsters/drowned_spawn

    #Husk
    #function nightmare:monsters/husk_spawn

    #<--------Skeleton-------->
    function nightmare:monsters/skeleton_spawn

    #<--------Spider-------->
    function nightmare:monsters/spider_spawn
    }

    #//////////////////////////////////[Zombie]//////////////////////////////////
    function zombie_spawn{
        #Strong and speedboy
        #execute if predicate nightmare:25change run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalzombie
        #Rain zombie
        #execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}

        #<--------Vanilla Zombie-------->
        data_damage_speed zombie 9 0.3
    }
    function skeleton_spawn{
        #<--------Vanilla Skeleton-------->
        data_damage_speed skeleton 9 0.3
    }
    function spider_spawn{
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:8f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Attributes:[{Base:3.0d,Name:"generic.attack_damage"},{Base:0.7d,Name:"generic.movement_speed"}],Tags:["nightmare","speedboy"]}
        #execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:20f,Attributes:[{Base:4.0d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        data_damage_speed spider 6 0.4
    }
    dir summons{
        function summoncirlce_vindicator{
            execute at @s run summon minecraft:vindicator ~ ~ ~ {CustomName:"\"Summoned vindicator\"",CustomNameVisible:0b}
            execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100
            kill @s
        }
    }
}
dir particles{
    dir summons{
        function summoncirlce_vindicator{
            execute as @e[type=minecraft:armor_stand,scores={SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run function nightmare:monsters/summons/summoncirlce_vindicator
            execute at @e[type=minecraft:armor_stand,scores={SummonCircle_Vindicator=..1},tag=SummonCircle_Vindicator] run spreadplayers ~ ~ 2 5 false @e[type=minecraft:armor_stand,sort=nearest,limit=1]
            scoreboard players remove @e[type=minecraft:armor_stand,tag=SummonCircle_Vindicator] SummonCircle_Vindicator 1
        }
    }
}
!IF(config.dev)
{
    dir development{
        function summonarmorstand{
            summon minecraft:armor_stand ~ ~1 ~ {CustomName:'{"text":"SummonCircle_Vindicator"}',Tags:["SummonCircle_Vindicator"],Invisible:1b,Invulnerable:1b}
            scoreboard players set @e[type=minecraft:armor_stand,name="SummonCircle_Vindicator",limit=1,sort=nearest] SummonCircle_Vindicator 100
        }
    }
}