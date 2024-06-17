# Generated with MC-Build

execute run gamerule doImmediateRespawn false
scoreboard objectives add Nightmare_Death deathCount
scoreboard objectives add Nightmare_Health health
scoreboard objectives add Nightmare_MaxHealth dummy
scoreboard objectives add Nightmare_WaitingForRevive dummy
scoreboard objectives add Nightmare_Testing dummy
#revive bossbar
bossbar add waiting_for_revive {"text":"Waiting for revive"}
#Revive Timer
scoreboard objectives add Nightmare_ReviveTimer dummy
#Revive block Timer
scoreboard objectives add Nightmare_DeathBlockTimer dummy
#block loops
scoreboard objectives add Nightmare_ReviveItemBlock dummy
#Reset health
scoreboard objectives add Nightmare_GoldenAppleEat minecraft.used:minecraft.golden_apple
scoreboard objectives add Nightmare_GoldenCarrotEat minecraft.used:minecraft.golden_carrot
scoreboard objectives add Nightmare_HoneyBottleEat minecraft.used:minecraft.honey_bottle
scoreboard objectives add Nightmare_AbsortionHearts dummy
scoreboard objectives add Nightmare_AbsortionHearts_Current_Health dummy
scoreboard objectives add Nightmare_AbsortionHearts_return dummy
scoreboard objectives add Nightmare_AbsortionHearts_return1 dummy
scoreboard objectives add Nightmare_AbsortionHearts_Dirty dummy
scoreboard objectives add Nightmare_AbsortionHearts_Div dummy
scoreboard objectives add Nightmare_AbsortionHearts_NewTest dummy