#execute if entity @a[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe",tag:{mineerspickaxe:1b}}}] as @s run effect give @s haste 1 1 true
execute if entity @a[nbt={SelectedItem:{tag:{mineerspickaxe:1b}}}] as @s run effect give @s haste 1 1 true
#/give @s diamond_pickaxe{mineerspickaxe:1b,display:{Lore:['[{"text":"Modifier: ","italic":false},{"text":"Haste 2","color":"yellow"}]']}} 1