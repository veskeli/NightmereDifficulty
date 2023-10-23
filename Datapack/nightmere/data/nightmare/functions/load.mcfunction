#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add Nightmare_INTERNAL dummy
execute run gamerule commandBlockOutput false
execute as @a run function nightmare:nightmareloaded
execute as @a run function nightmare:nightmareversion
execute as @a[tag=Nightmare_joined] run function nightmare:__generated__/block/0