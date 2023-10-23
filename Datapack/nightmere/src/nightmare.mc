function nightmareversion{
    tellraw @s ["",{"text":"Nightmare","bold":true,"color":"red"},{"text":" Build: "},{"text":"1","underlined":true,"color":"yellow"},{"text":"\n"},{"text":"Rewrite","color":"aqua"},{"text":" update"}]
}

function load{
    execute run gamerule commandBlockOutput false

    #Loaded Text
    tellraw @a {"text":"\n "}
    tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
    tellraw @a {"text":"\n "}

    #Version Text
    execute as @a run function nightmare:nightmareversion
}

function tick{

}

function commandfeedback{
    gamerule sendCommandFeedback true
}