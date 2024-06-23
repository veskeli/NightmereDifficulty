# Generated with MC-Build

tag @s add checking_for_players
# Reset attributes
function nightmare_skilltree:fighter/remove_all
# check for players within 10 blocks
execute as @e[limit=1,distance=..10,type=minecraft:player,tag=!checking_for_players] run function nightmare_skilltree:fighter/emboldening_presence/check_for_close_players/players_close_trigger
tag @s remove checking_for_players