#built using mc-build (https://github.com/mc-build/mc-build)

clear @s warped_fungus_on_a_stick{potionofwitch:1b} 1
scoreboard players add @s potionofwitch 1
scoreboard players add @s Nightmare_MaxMana 3
title @s times 20 80 20
title @s subtitle ["",{"text":"Maximum mana increased to","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_MaxMana"},"color":"dark_green"}]
title @s title {"text":""}