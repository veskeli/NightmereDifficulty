# Generated with MC-Build

execute store result score @p[distance=..8] objd_gui_count if data entity @s Items[].tag.objd.gui
execute if score @p[distance=..8] objd_gui_count matches 0 run function nightmare_skilltree:spell_select1/reset_gui1
execute unless score @p[distance=..8] objd_gui_count matches 27 run function nightmare_skilltree:spell_select1/actions1
execute if block ~ ~-1 ~ minecraft:hopper run data merge block ~ ~-1 ~ {TransferCooldown:20d}