summon area_effect_cloud ~ ~ ~ {Duration: 1, Tags: [ray]}

execute anchored eyes rotated as @s run tp @e[tag=ray,limit=1,sort=nearest] ^ ^ ^ ~ ~

execute as @e[tag=ray,limit=1,sort=nearest] run function nightmare:ray/process