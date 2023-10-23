#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a Nightmare_MaxMana 0
scoreboard players add @a Nightmare_ManaRegneration 0
scoreboard players add @a Nightmare_Mana 0
scoreboard players add @a Nightmare_UseDelay 0
execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wand:1b}}}] run title @s actionbar ["",{"text":"Mana:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_Mana"},"color":"dark_green"},{"text":" | ","color":"gold"},{"text":"MRC:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_ManaRegneration"},"color":"dark_green"},{"text":" |","color":"gold"},{"text":" Cooldown: ","color":"dark_aqua"},{"score":{"name":"@s","objective":"Nightmare_UseDelay"},"color":"dark_green"}]
execute as @a[scores={Nightmare_MaxMana=0}] run function nightmare:manasystem/init
function nightmare:potions/updatepotions