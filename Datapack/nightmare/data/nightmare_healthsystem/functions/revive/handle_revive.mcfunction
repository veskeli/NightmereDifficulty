# Generated with MC-Build

tag @s add NoValidPlayer
execute at @s if score @a[distance=..16,limit=1,sort=nearest] Nightmare_WaitingForRevive matches 1 run function nightmare_healthsystem:revive/zzz/0
#No valid player found
execute as @s[tag=NoValidPlayer] run function nightmare_healthsystem:revive/zzz/3
#valid player found (usually just kill @s)
execute as @s[tag=!NoValidPlayer] run function nightmare_healthsystem:revive/zzz/5