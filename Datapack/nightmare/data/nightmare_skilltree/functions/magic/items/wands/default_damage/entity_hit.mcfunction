# Generated with MC-Build

# damage if owner is holding the wand in the main hand
execute if entity @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{NDS_TestWand:1b}}}] run function nightmare_skilltree:magic/items/wands/default_damage/zzz/0
# retrun if success
execute if entity @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{NDS_TestWand:1b}}}] run return 1
# damage if owner is holding the wand in the off hand
execute if entity @a[limit=1,tag=raycasting,sort=nearest,nbt={Inventory:[{id:"minecraft:warped_fungus_on_a_stick",Slot:-106b,tag:{NDS_TestWand:1b}}]}] run function nightmare_skilltree:magic/items/wands/default_damage/zzz/1