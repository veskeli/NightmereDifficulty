#Nightmare Difficulty Generated

execute at @s run summon item_display ~ ~ ~ {CustomNameVisible:1b,billboard:"vertical",Tags:["grave_digger","WaitingForRevive"],CustomName:'{"text":"Waiting for revive"}',item:{id:"minecraft:wooden_shovel",Count:1b}}
execute at @s run function nightmare_healthsystem:effects/revive_start