#built using mc-build (https://github.com/mc-build/mc-build)

execute run gamerule commandBlockOutput false
scoreboard objectives add currentevent dummy
scoreboard players add $overworld currentevent 0
scoreboard objectives add steps dummy
scoreboard objectives add fireExpended dummy
scoreboard objectives add slowfalleffect dummy
scoreboard objectives add jumpboost2_effect dummy
scoreboard objectives add speedboyboots_effect dummy
scoreboard objectives add haste2_effect dummy
scoreboard objectives add basicgliderDurability dummy
scoreboard objectives add basicglidereffect dummy
scoreboard objectives add basicgliderCharge dummy
scoreboard objectives add advancedgliderDurability dummy
scoreboard objectives add advancedglidereffect dummy
scoreboard objectives add advancedgliderCharge dummy
scoreboard objectives add teleportarrowowner dummy
scoreboard objectives add teleportskeletonarrowowner dummy
scoreboard players set $total teleportskeletonarrowowner 1
scoreboard objectives add NMARROW_x1 dummy
scoreboard objectives add NMARROW_y1 dummy
scoreboard objectives add NMARROW_z1 dummy
scoreboard objectives add NMARROW_x2 dummy
scoreboard objectives add NMARROW_y2 dummy
scoreboard objectives add NMARROW_z2 dummy
scoreboard objectives add Nightmare_NetherWeakensTitle dummy
function nightmare:manasystem/setupmana
function nightmare:idsystem/setupid
bossbar add bloodking {"text":"Blood king","color":"red","bold":true}
bossbar set bloodking color red
schedule function nightmare:effects/poisoncreepereffect 1s
schedule function nightmare:effects/speedboyeffect 0.5s
tellraw @a {"text":"\n "}
tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
tellraw @a {"text":"\n "}
execute as @a run function nightmare:nightmareversion