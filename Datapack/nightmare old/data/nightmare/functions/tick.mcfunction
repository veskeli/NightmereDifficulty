#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a[tag=!joined] run function nightmare:__generated__/block/0
function nightmare:idsystem/updateid
function nightmare:manasystem/updatemana
execute if score $overworld currentevent matches 0 run function nightmare:no_event_overworld_enemies
execute if score $nether currentevent matches 0 run function nightmare:monsters/ghast_spawn
function nightmare:monsters/irongloem_spawn
function nightmare:custom_monsters/raid3
function nightmare:custom_monsters/raid4
function nightmare:custom_monsters/raid5
function nightmare:monsters/pillager_spawn
function nightmare:monsters/vindicator_spawn
function nightmare:custom_monsters/tntvindicator
function nightmare:monsters/boss_spawn
execute at @e[tag=ritualspot] run function nightmare:particles/outercircle
tag @a remove InAir
execute as @a[nbt={OnGround:0b}] run tag @s add InAir
execute as @a run function nightmare:glidereffects/basicglider
execute as @a run function nightmare:glidereffects/advancedglider
function nightmare:arroweffects/phantomking
function nightmare:arroweffects/teleportarrow
function nightmare:arroweffects/firearrow
execute as @e[type=arrow,tag=!arroweffect] run tag @s add arroweffect
function nightmare:effects/setstatuseffects
function nightmare:effects/statuseffects
scoreboard objectives add wanduse minecraft.used:warped_fungus_on_a_stick
execute as @a if score @s wanduse matches 1.. run function nightmare:wands/checkwand
scoreboard players add @a Nightmare_NetherWeakensTitle 0
execute as @a[scores={Nightmare_NetherWeakensTitle=0}] at @s if predicate nightmare:nether run function nightmare:__generated__/block/1