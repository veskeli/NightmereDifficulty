# Generated with MC-Build

# if the player has book in ther main hand, summon chest
execute if entity @s[nbt={SelectedItem:{id:"minecraft:book"}}] at @s run function nightmare_skilltree:magic/items/wands/select_spell/summonchest
execute if entity @s[nbt={SelectedItem:{id:"minecraft:book"}}] at @s run return 1
# if the player has book in ther off hand, summon chest
execute if entity @s[nbt={Inventory:[{id:"minecraft:book",Slot:-106b}]}] at @s run function nightmare_skilltree:magic/items/wands/select_spell/summonchest
execute if entity @s[nbt={Inventory:[{id:"minecraft:book",Slot:-106b}]}] at @s run return 1
# check that the cooldown is 1 or more
execute if score @s NDS_SpellCooldown matches 1.. run return 1
# Check main hand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["default_damage"]}}}] at @s run function nightmare_skilltree:magic/items/wands/default_damage/start
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["default_damage"]}}}] at @s run return 1
# Check off hand
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["default_damage"]}}]}] at @s run function nightmare_skilltree:magic/items/wands/default_damage/start
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["default_damage"]}}]}] at @s run return 1
# Check main hand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["slowness1"]}}}] at @s run function nightmare_skilltree:magic/items/wands/slowness1/start_raycast
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["slowness1"]}}}] at @s run return 1
# Check off hand
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["slowness1"]}}]}] at @s run function nightmare_skilltree:magic/items/wands/slowness1/start_raycast
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["slowness1"]}}]}] at @s run return 1
# Check main hand
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["haste1"]}}}] at @s run function nightmare_skilltree:magic/items/wands/slowness1/start_raycast
execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{CustomTags:["haste1"]}}}] at @s run return 1
# Check off hand
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["haste1"]}}]}] at @s run function nightmare_skilltree:magic/items/wands/slowness1/start_raycast
execute if entity @s[nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{CustomTags:["haste1"]}}]}] at @s run return 1