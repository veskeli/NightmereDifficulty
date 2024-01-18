#Nightmare Difficulty Generated

tag @s add NoValidPlayer
execute at @s if score @a[distance=..16,limit=1,sort=nearest] Nightmare_WaitingForRevive matches 1 run function nightmare_healthsystem:revive/__generated__/block/6
execute as @s[tag=NoValidPlayer] run function nightmare_healthsystem:revive/__generated__/block/9
execute as @s[tag=!NoValidPlayer] run function nightmare_healthsystem:revive/__generated__/block/11