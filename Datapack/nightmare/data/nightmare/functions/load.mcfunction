#Nightmare Difficulty Generated

scoreboard objectives add Nightmare_INTERNAL dummy
execute run gamerule commandBlockOutput false
execute as @a run function nightmare:nightmareloaded
execute as @a run function nightmare:nightmareversion
scoreboard objectives add Nightmare_currentevent dummy
scoreboard players add $overworld Nightmare_currentevent 0
scoreboard players add $nether Nightmare_currentevent 0
scoreboard objectives add Nightmare_SummonCircle_Vindicator dummy
schedule function nightmare:particles/summons_schedules/summoncirlce_vindicator 0.2s
scoreboard objectives add Nightmare_FloorCraft_RottenHeartCooldown dummy
scoreboard objectives add Nightmare_WitchSummonTimer dummy
scoreboard objectives add Nightmare_WitchHealth dummy
schedule function nightmare:development/schedule_witchsummon 1s
schedule function nightmare:particles/mob_schedules/speedboy_particle 1s
scoreboard objectives add Nightmare_Item_use minecraft.used:warped_fungus_on_a_stick
scoreboard objectives add Nightmare_Item_Ray_steps dummy
scoreboard objectives add Nightmare_Item_Ray_Return dummy
scoreboard objectives add Nightmare_snowballs_used minecraft.used:minecraft.snowball
scoreboard objectives add DeathCount deathCount
execute as @a[tag=Nightmare_joined] run function nightmare:__generated__/block/0
function nightmare_nether_survival:custom_load