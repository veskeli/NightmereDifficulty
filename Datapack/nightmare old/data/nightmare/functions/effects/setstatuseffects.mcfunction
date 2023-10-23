#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a if predicate nightmare:jumpboost2 as @s run scoreboard players set @s jumpboost2_effect 1
execute as @a[scores={jumpboost2_effect=1..}] unless predicate nightmare:jumpboost2 as @s run scoreboard players set @s jumpboost2_effect 0
execute as @a if predicate nightmare:speedboyboots as @s run scoreboard players set @s speedboyboots_effect 1
execute as @a[scores={speedboyboots_effect=1..}] unless predicate nightmare:speedboyboots as @s run scoreboard players set @s speedboyboots_effect 0
execute as @a if predicate nightmare:hastehelmet as @s run scoreboard players set @s haste2_effect 1
execute as @a[scores={haste2_effect=1..}] unless predicate nightmare:hastehelmet as @s run scoreboard players set @s haste2_effect 0