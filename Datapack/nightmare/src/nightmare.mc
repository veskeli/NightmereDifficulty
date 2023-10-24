#built using mc-build (https://github.com/mc-build/mc-build) :D
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

    #<--------Show join text-------->
    execute as @a[tag=Nightmare_joined] run block{
        tellraw @s {"text":"Profile loaded!"}
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

    #skeleton
    #function nightmare:monsters/skeleton_spawn

    #Spider
    #function nightmare:monsters/spider_spawn
    }

    #//////////////////////////////////[Zombie]//////////////////////////////////
    function zombie_spawn{
        #Strong and speedboy
        #execute if predicate nightmare:25change run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalzombie
        #Rain zombie
        #execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}

        #<--------Vanilla Zombie-------->
        execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}
    }
}