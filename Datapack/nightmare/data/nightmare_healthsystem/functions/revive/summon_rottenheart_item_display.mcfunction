# Generated with MC-Build

execute if score @s Nightmare_ReviveItemBlock matches 1 run return 1
#Summon revive item
execute at @s run summon item_display ~ ~1 ~ {CustomNameVisible:1b,billboard:"vertical",Tags:["rottenheart","WaitingForRevive"],CustomName:'{"text":"Revive in progress"}',item:{id:"minecraft:phantom_membrane",Count:1b}}
#effect
execute at @s run function nightmare_healthsystem:effects/revive_start
#destory item
kill @s