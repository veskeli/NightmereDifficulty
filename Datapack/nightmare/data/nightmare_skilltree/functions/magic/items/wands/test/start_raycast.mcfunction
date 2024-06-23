# Generated with MC-Build

# add cooldown
scoreboard players set @s NDS_SpellCooldown 5
# Reset scoreboards
scoreboard players reset @s NDS_Item_Ray_steps
scoreboard players reset .distance NDS_Item_Ray_steps
execute as @s run scoreboard players operation .distance NDS_RangedSpellRange = @s NDS_RangedSpellRange
scoreboard players reset .cooldown NDS_FlameEffectCooldown
# Raycast
tag @s add raycasting
execute anchored eyes positioned ^ ^ ^ store result score @s NDS_Item_Ray_Return run function nightmare_skilltree:magic/items/wands/test/raycast
tag @s remove raycasting
# Returns score to "@s" "NDS_Item_Ray_Return" base on hit: 1 entity, 2 block, 3 no hit
# scoreboard players set @s Nm_testing_wand_active 1