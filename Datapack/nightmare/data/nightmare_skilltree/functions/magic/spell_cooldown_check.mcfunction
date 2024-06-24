# Generated with MC-Build

schedule function nightmare_skilltree:magic/spell_cooldown_check 0.1s replace
# if block mana title is greater than 0, reduce it by 1
execute as @a[scores={NDS_BlockManaTitle=1..}] run scoreboard players remove @s NDS_BlockManaTitle 1
# if cooldown is greater than 0, reduce it by 1
execute as @a[scores={NDS_SpellCooldown=1..}] run scoreboard players remove @s NDS_SpellCooldown 1
# if no score is found for the player, set it to 0
execute as @a unless score @s NDS_SpellCooldown matches -1000.. run scoreboard players set @s NDS_SpellCooldown 0