# Generated with MC-Build

# If block mana title is more then 1, return
execute if score @s NDS_BlockManaTitle matches 1.. run return 1
# title @s actionbar ["",{"text":"====| ","color":"yellow"},{"text":"Mana:","color":"aqua"},{"text":"□ ■ ■","color":"green"},{"text":" |====","color":"yellow"}]
# Show cooldown
title @s actionbar ["",{"text":"====| ","color":"yellow"},{"text":"Cooldown: ","color":"aqua"},{"score":{"name":"@s","objective":"NDS_SpellCooldown"}},{"text":" |====","color":"yellow"}]