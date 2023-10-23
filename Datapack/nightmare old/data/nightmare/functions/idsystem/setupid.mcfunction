#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add id dummy
execute if score $total id >= 0 id run scoreboard players set $total id 1