execute as @e[tag=speedboy] at @s run particle soul_fire_flame ~ ~0.2 ~ .2 .1 .2 0 30 force
#execute if entity @a[nbt={Inventory:[{id:"minecraft:leather_boots",tag:{SpeedBoyBoots:1b}},{Slot:100b}]}] at @a[nbt={Inventory:[{id:"minecraft:leather_boots",tag:{SpeedBoyBoots:1b}},{Slot:100b}]}] run particle soul_fire_flame ~ ~0.2 ~ .2 .1 .2 0 30 force
execute as @a if predicate nightmare:speedboyboots at @s run particle soul_fire_flame ~ ~0.2 ~ .2 .1 .2 0 30 force
schedule function nightmare:effects/speedboyeffect 0.5s