# Generated with MC-Build

execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 50 normal
#kill interaction
kill @e[limit=1,type=interaction,sort=nearest,tag=GraveInteractable]
#kill item display
kill @e[limit=1,type=item_display,sort=nearest,tag=GraveInteractable]