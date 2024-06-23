# Generated with MC-Build

# if already selecting spell, return
execute if entity @e[tag=selecting_spell,distance=..10] run say already selecting spell
execute if entity @e[tag=selecting_spell,distance=..10] run return 1
tag @p add selecting_spell
execute as @p run summon minecraft:chest_minecart ^ ^1.5 ^2 {CustomName:"\"Select Spell\"",NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["objd_gui_cart"],CustomDisplayTile:1d,DisplayState:{Name:"air"},DisplayOffset:1d}