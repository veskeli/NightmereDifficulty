#Nightmare Difficulty Generated

execute as @a[scores={Nightmare_Death=1..}] run function nightmare_healthsystem:handle_death
execute as @a[scores={Nightmare_Death=3..,Nightmare_Health=1..}] run function nightmare_healthsystem:handle_after_death
execute as @a run function nightmare_healthsystem:temp_effects/check_update_absortion_hearts_score
function nightmare_healthsystem:revive/revive_tick
bossbar set waiting_for_revive players @a[scores={Nightmare_WaitingForRevive=1}]
scoreboard players add @e[type=item_display,tag=GraveInteractable] Nightmare_DeathBlockTimer 1
execute as @e[type=item_display,tag=GraveInteractable,limit=1,scores={Nightmare_DeathBlockTimer=8000..}] run function nightmare_healthsystem:__generated__/block/0
execute as @a[scores={Nightmare_GoldenAppleEat=1..}] run function nightmare_healthsystem:__generated__/block/1
execute as @a[scores={Nightmare_GoldenCarrotEat=1..}] run function nightmare_healthsystem:__generated__/block/2
function nightmare_healthsystem:temp_effects/custom_tick