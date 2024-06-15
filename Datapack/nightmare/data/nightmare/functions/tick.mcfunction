#Nightmare Difficulty Generated

execute if score $overworld Nightmare_CustomMobs matches 1 run return 1
execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies
execute if score $nether Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_nether_enemies
function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check
execute as @a if score @s Nightmare_Item_use matches 1.. run function nightmare:items/check_items
function nightmare:monsters/entities/snowball_damage/snowball_check