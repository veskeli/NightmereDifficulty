# Generated with MC-Build

# If minecart not found then continue to summon
execute as @e[tag=selecting_spell,distance=..10] run execute unless entity @e[tag=objd_gui_cart,distance=..10] run scoreboard players set .return NDS_SelectSpellReturn 1
execute if score .return NDS_SelectSpellReturn matches 1 run return 1
# Else its found, dont summon
tellraw @s ["",{"text":"Magic","color":"dark_gray"},{"text":" | ","color":"white"},{"text":"Cast failed","color":"red"},{"text":" = ","color":"dark_gray"},{"text":"Already selecting spell","color":"white"}]
playsound minecraft:block.note_block.bass master @p ~ ~ ~ 1 1
scoreboard players set .return NDS_SelectSpellReturn 0