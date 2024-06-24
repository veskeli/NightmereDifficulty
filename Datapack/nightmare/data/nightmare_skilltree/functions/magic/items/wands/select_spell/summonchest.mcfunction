# Generated with MC-Build

scoreboard players reset .return NDS_SelectSpellReturn
# if already selecting spell, return
execute if entity @e[tag=selecting_spell,distance=..10] run function nightmare_skilltree:magic/items/wands/select_spell/check_if_already_selecting
# return if already selecting spell
execute if score .return NDS_SelectSpellReturn matches 0 run return 1
execute as @p run summon minecraft:chest_minecart ^ ^1.5 ^2 {CustomName:"\"Select Spell\"",NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["objd_gui_cart"],CustomDisplayTile:1d,DisplayState:{Name:"air"},DisplayOffset:1d}
# Remove tag from player
tag @p add selecting_spell