#Nightmare Difficulty Generated

execute as @a[tag=!Nightmare_joined] run function nightmare:__generated__/block/1
execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies
function nightmare:particles/summons/summoncirlce_vindicator
function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check
execute as @a if score @s Nightmare_Wanduse matches 1.. run function nightmare:magic/wands/checkwand