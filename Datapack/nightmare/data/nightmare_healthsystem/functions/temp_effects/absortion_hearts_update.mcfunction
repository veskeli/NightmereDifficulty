#Nightmare Difficulty Generated

tellraw @s ["",{"text":"Set absortion to: "},{"score":{"name":"@s","objective":"Nightmare_AbsortionHearths"}}]
execute as @s run effect clear @s absorption
execute if score @s Nightmare_AbsortionHearths matches 1 run effect give @s absorption infinite 0 true
execute if score @s Nightmare_AbsortionHearths matches 1 run damage @s 2
execute if score @s Nightmare_AbsortionHearths matches 2 run effect give @s absorption infinite 0 true
execute if score @s Nightmare_AbsortionHearths matches 3 run effect give @s absorption infinite 1 true
execute if score @s Nightmare_AbsortionHearths matches 3 run damage @s 2
execute if score @s Nightmare_AbsortionHearths matches 4 run effect give @s absorption infinite 1 true
execute if score @s Nightmare_AbsortionHearths matches 5 run effect give @s absorption infinite 2 true
execute if score @s Nightmare_AbsortionHearths matches 5 run damage @s 2
execute if score @s Nightmare_AbsortionHearths matches 6 run effect give @s absorption infinite 2 true
execute if score @s Nightmare_AbsortionHearths matches 7 run effect give @s absorption infinite 2 true
execute if score @s Nightmare_AbsortionHearths matches 7 run damage @s 2
execute if score @s Nightmare_AbsortionHearths matches 8 run effect give @s absorption infinite 2 true
execute if score @s Nightmare_AbsortionHearths matches 9 run effect give @s absorption infinite 2 true
execute if score @s Nightmare_AbsortionHearths matches 9 run damage @s 2
execute if score @s Nightmare_AbsortionHearths matches 10 run effect give @s absorption infinite 2 true