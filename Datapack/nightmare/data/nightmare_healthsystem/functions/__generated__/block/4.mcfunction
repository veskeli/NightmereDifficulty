#Nightmare Difficulty Generated

clear @s wooden_shovel{grave_digger:1b} 1
scoreboard players set @s Nightmare_Item_Ray_Return 1
execute as @e[type=item_display,sort=nearest,limit=1,tag=GraveInteractable] run function nightmare_healthsystem:revive/summon_grave_digger_item_display