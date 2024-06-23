# Generated with MC-Build

#=================================================
# Custom Crafting
#=================================================
# TODO: add crafting to own pack
function nightmare:custom_crafting/lava_cauldron/rottenhearth_craft_check
function nightmare:custom_crafting/lava_cauldron/rottenhearth_armor_stand_check
#=================================================
# Items
#=================================================
# TODO: add items to own pack
execute as @a if score @s Nightmare_Item_use matches 1.. run function nightmare:items/check_items
# Entities
function nightmare:monsters/entities/snowball_damage/snowball_check
#<--------Summon circles-------->
# Handle circle timer
# function nightmare_particle:particles/summons/summoncirlce_vindicator
# function nightmare:development/testwitch
# function nightmare:development/witchhurtdetect