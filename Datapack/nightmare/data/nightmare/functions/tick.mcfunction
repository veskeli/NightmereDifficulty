#Nightmare Difficulty Generated

execute as @a[tag=!Nightmare_joined] run function nightmare:__generated__/block/1
execute if score $overworld Nightmare_currentevent matches 0 run function nightmare:monsters/no_event_overworld_enemies
function nightmare:particles/summons/summoncirlce_vindicator