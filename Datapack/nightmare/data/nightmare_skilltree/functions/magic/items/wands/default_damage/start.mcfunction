# Generated with MC-Build

execute at @s run playsound minecraft:entity.illusioner.mirror_move player @a ~ ~ ~ 1 0.2
# damage @s <%damage%> minecraft:magic by @a[limit=1,tag=raycasting,sort=nearest,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{NDS_TestWand:1b}}}]
function nightmare_skilltree:magic/items/wands/default_damage/start_raycast
function nightmare_skilltree:magic/items/wands/default_damage/raycast