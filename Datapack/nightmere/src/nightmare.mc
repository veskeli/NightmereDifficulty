#built using mc-build (https://github.com/mc-build/mc-build) :D
function nightmareversion{
    tellraw @s ["",{"text":"Nightmare","bold":true,"color":"red"},{"text":" Build: "},{"text":"1","underlined":true,"color":"yellow"},{"text":"\n"},{"text":"Rewrite","color":"aqua"},{"text":" update"}]
}

function nightmareloaded{
    tellraw @a {"text":"\n "}
    tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
    tellraw @a {"text":"\n "}
}

function load{
    #Dont remove or edit -->
    scoreboard objectives add Nightmare_INTERNAL dummy
    execute run gamerule commandBlockOutput false

    #Loaded Text
    execute as @a run function nightmare:nightmareloaded

    #Version Text
    execute as @a run function nightmare:nightmareversion
    #<--

    #Show join text
    execute as @a[tag=Nightmare_joined] run block{
        tellraw @s {"text":"Profile loaded!"}
    }
}

function tick{
    #Join system
    execute as @a[tag=!Nightmare_joined] run block{
        tag @s add Nightmare_joined
        tellraw @s {"text":"Profile Created!"}
    }
}

function commandfeedback{
    gamerule sendCommandFeedback true
}