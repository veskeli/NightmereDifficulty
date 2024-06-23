# Generated with MC-Build

# Check if player has wand in hand
execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{Nightmare_Wand:1b}}}] run title @s actionbar ["",{"text":"====| ","color":"yellow"},{"text":"Mana:","color":"aqua"},{"text":"□ ■ ■","color":"green"},{"text":" |====","color":"yellow"}]
function nightmare_equipment:equipment/check_wand_effects
execute as @a if score @s Nm_Warped_Fungus_Used matches 1.. run function nightmare_equipment:equipment/check_wands