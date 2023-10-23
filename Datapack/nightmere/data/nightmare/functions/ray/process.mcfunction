scoreboard players set @s steps 100

execute at @s run function nightmare:ray/move

execute as @s[tag=hitBlock] at @s run function nightmare:ray/hit

kill @s