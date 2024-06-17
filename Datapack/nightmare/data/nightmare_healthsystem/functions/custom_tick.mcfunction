# Generated with MC-Build

#Handle death
execute as @a[scores={Nightmare_Death=1..}] run function nightmare_healthsystem:handle_death
execute as @a[scores={Nightmare_Death=3..,Nightmare_Health=1..}] run function nightmare_healthsystem:handle_after_death
#check absortion
execute as @a run function nightmare_healthsystem:temp_effects/check_update_absortion_hearts_score
#Check revive
function nightmare_healthsystem:revive/revive_tick
#Show wait for revive bossbar
bossbar set waiting_for_revive players @a[scores={Nightmare_WaitingForRevive=1}]
#Timer
scoreboard players add @e[type=item_display,tag=GraveInteractable] Nightmare_DeathBlockTimer 1
execute as @e[type=item_display,tag=GraveInteractable,limit=1,scores={Nightmare_DeathBlockTimer=8000..}] run function nightmare_healthsystem:zzz/0
#reset hp
#Golden apple
execute as @a[scores={Nightmare_GoldenAppleEat=1..}] run function nightmare_healthsystem:zzz/1
#Golden carrot
execute as @a[scores={Nightmare_GoldenCarrotEat=1..}] run function nightmare_healthsystem:zzz/2
function nightmare_healthsystem:temp_effects/custom_tick