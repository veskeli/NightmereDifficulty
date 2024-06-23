# Generated with MC-Build

# block motion
data merge entity @s {Motion:[0.0d,0.0d,0.0d]}
# check if player is too far
execute at @s unless entity @a[distance=..3] run function nightmare_skilltree:check_select_spell_chest/kill_select_spell_chest