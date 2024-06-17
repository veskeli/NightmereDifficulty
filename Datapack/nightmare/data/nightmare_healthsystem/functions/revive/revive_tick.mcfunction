# Generated with MC-Build

execute as @e[type=item,nbt={OnGround:1b,Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{rottenhearth:1b}}}] run function nightmare_healthsystem:revive/summon_rottenheart_item_display
#if score/timer then craft
execute as @e[type=item_display,tag=WaitingForRevive,limit=1,scores={Nightmare_ReviveTimer=50..}] run function nightmare_healthsystem:revive/handle_revive
#Timer
scoreboard players add @e[type=item_display,tag=WaitingForRevive] Nightmare_ReviveTimer 1
#grave digger check
execute as @e[type=item_display,tag=grave_digger,limit=1,scores={Nightmare_ReviveTimer=5..}] run function nightmare_healthsystem:revive/handle_revive