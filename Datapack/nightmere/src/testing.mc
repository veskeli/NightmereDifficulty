function load{
    execute run gamerule commandBlockOutput false

    #Loaded Text
    execute as @a run function nightmare:nightmareloaded

    #Version Text
    execute as @a run function nightmare:nightmareversion
}