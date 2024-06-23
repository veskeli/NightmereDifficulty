# Generated with MC-Build

# enable trigger for wizard skilltree
scoreboard players enable @a[scores={NDS_WizardSkilltree=1..}] GetTestingWand
# check the trigger
execute as @a[scores={GetTestingWand=1..}] run function nightmare_skilltree:wizard/getwand
# if player has no range score, set it to 150
execute as @a unless score @s NDS_RangedSpellRange matches -1000.. run function nightmare_skilltree:wizard/reset_range