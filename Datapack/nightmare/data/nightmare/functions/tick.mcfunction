#Nightmare Difficulty Generated

execute as @a[tag=!Nightmare_joined] run function nightmare:__generated__/block/1
execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies
execute if score $nether Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_nether_enemies
function nightmare:particles/summons/summoncirlce_vindicator
function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check
execute as @a[scores={Nightmare_Death=1..}] run function nightmare:death/handle_death