#execute if entity @s[nbt={Inventory:[{id:"minecraft:leather_boots",tag:{JumpBoostSimple:1b}},{Slot:100b}]}] as @s run effect give @s jump_boost 1 1 true
execute if predicate nightmare:jumpboost2 as @s run scoreboard players set @s jumpboost2_effect 1
execute unless predicate nightmare:jumpboost2 as @s run scoreboard players set @s jumpboost2_effect 0
#/give @s leather_boots{JumpBoostSimple:1b,display:{Name:'[{"text":"Leather Boots","italic":false}]',Lore:['[{"text":"Modifier: ","italic":false},{"text":"Jump boost 2","color":"yellow"}]']}} 1