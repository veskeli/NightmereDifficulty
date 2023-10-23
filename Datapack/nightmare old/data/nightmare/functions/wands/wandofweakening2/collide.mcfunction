#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add .distance steps 1000
execute at @s run summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:1,Radius:4f,Duration:80,Effects:[{Id:2,Amplifier:0b,Duration:80},{Id:18,Amplifier:0b,Duration:140}]}