#Nightmare Difficulty Generated

scoreboard objectives add Nightmare_INTERNAL dummy
execute run gamerule commandBlockOutput false
execute as @a run function nightmare:nightmareloaded
execute as @a run function nightmare:nightmareversion
scoreboard objectives add currentevent dummy
scoreboard players add $overworld currentevent 0
execute as @a[tag=Nightmare_joined] run function nightmare:__generated__/block/0