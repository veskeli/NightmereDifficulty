#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add summonertest dummy
execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=1..}] run function nightmare:wands/summonertest/__generated__/block/10