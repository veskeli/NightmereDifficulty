#built using mc-build (https://github.com/mc-build/mc-build)

setblock ~ ~ ~ torch
execute positioned ~ ~ ~ run particle dust 0.816 1 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 50
playsound entity.arrow.hit_player player @s ~ ~ ~ 0.4
clear @p torch 1