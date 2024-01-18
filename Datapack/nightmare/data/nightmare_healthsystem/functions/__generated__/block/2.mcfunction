#Nightmare Difficulty Generated

execute as @s if score @s Nightmare_MaxHealth matches 14.. run return 1
execute as @s run attribute @s generic.max_health base set 14
execute as @s run scoreboard players set @s Nightmare_MaxHealth 14
execute at @s run particle minecraft:totem_of_undying ~ ~ ~ 0 0 0 1 20 force
execute at @s run playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~
scoreboard players reset @s Nightmare_GoldenCarrotEat