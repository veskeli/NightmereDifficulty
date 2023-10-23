gamerule sendCommandFeedback false
gamerule playersSleepingPercentage 1
tellraw @s {"text":"Sleep settings set!","color":"green"}
schedule function nightmare:commandfeedback 1t replace