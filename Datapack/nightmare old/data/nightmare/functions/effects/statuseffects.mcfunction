#built using mc-build (https://github.com/mc-build/mc-build)

execute if entity @a[scores={slowfalleffect=1}] as @a[scores={slowfalleffect=1}] run effect give @s slow_falling 999999 0 true
execute if entity @a[scores={slowfalleffect=1}] as @a[scores={slowfalleffect=1}] run scoreboard players set @s slowfalleffect 2
execute if entity @a[scores={slowfalleffect=0}] run effect clear @a[scores={slowfalleffect=0}] slow_falling
execute if entity @a[scores={slowfalleffect=0}] as @a[scores={slowfalleffect=0}] run scoreboard players set @s slowfalleffect -1
execute if entity @a[scores={jumpboost2_effect=1}] as @a[scores={jumpboost2_effect=1}] run effect give @s jump_boost 999999 1 true
execute if entity @a[scores={jumpboost2_effect=1}] as @a[scores={jumpboost2_effect=1}] run scoreboard players set @s jumpboost2_effect 2
execute if entity @a[scores={jumpboost2_effect=0}] run effect clear @a[scores={jumpboost2_effect=0}] jump_boost
execute if entity @a[scores={jumpboost2_effect=0}] as @a[scores={jumpboost2_effect=0}] run scoreboard players set @s jumpboost2_effect -1
execute if entity @a[scores={speedboyboots_effect=1}] as @a[scores={speedboyboots_effect=1}] run effect give @s speed 999999 3 true
execute if entity @a[scores={speedboyboots_effect=1}] as @a[scores={speedboyboots_effect=1}] run scoreboard players set @s speedboyboots_effect 2
execute if entity @a[scores={speedboyboots_effect=0}] run effect clear @a[scores={speedboyboots_effect=0}] speed
execute if entity @a[scores={speedboyboots_effect=0}] as @a[scores={speedboyboots_effect=0}] run scoreboard players set @s speedboyboots_effect -1
execute if entity @a[scores={haste2_effect=1}] as @a[scores={haste2_effect=1}] run effect give @s haste 999999 1 true
execute if entity @a[scores={haste2_effect=1}] as @a[scores={haste2_effect=1}] run scoreboard players set @s haste2_effect 2
execute if entity @a[scores={haste2_effect=0}] run effect clear @a[scores={haste2_effect=0}] haste
execute if entity @a[scores={haste2_effect=0}] as @a[scores={haste2_effect=0}] run scoreboard players set @s haste2_effect -1