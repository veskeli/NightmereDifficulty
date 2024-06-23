# Generated with MC-Build

# cooldown
execute if score .cooldown NDS_FlameEffectCooldown matches 1.. run scoreboard players remove .cooldown NDS_FlameEffectCooldown 1
execute if score .cooldown NDS_FlameEffectCooldown matches 1.. run return 1
particle minecraft:soul_fire_flame ~ ~ ~ 0 0 0 0.02 1 force
scoreboard players add .cooldown NDS_FlameEffectCooldown 8