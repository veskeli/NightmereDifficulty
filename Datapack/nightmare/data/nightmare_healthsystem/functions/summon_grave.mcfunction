# Generated with MC-Build

execute at @s run summon item_display ~ ~1 ~ {CustomNameVisible:1b,billboard:"center",Tags:["ReviveBlockArea","GraveInteractable"],CustomName:'{"text":"Recent death"}',item:{id:"minecraft:nether_star",Count:1b}}
execute as @e[type=minecraft:item_display,sort=nearest,limit=1] at @s positioned ~ ~-0.5 ~ summon interaction run data merge entity @s {width:1,height:1,response:1,Tags:[GraveInteractable]}