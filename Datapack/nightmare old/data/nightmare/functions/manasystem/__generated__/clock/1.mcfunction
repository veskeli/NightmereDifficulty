#built using mc-build (https://github.com/mc-build/mc-build)

schedule function nightmare:manasystem/__generated__/clock/1 0.5s
execute run scoreboard players set $total Nightmare_MaxMana 15
execute as @a[scores={Nightmare_ManaRegneration=1..}] run function nightmare:manasystem/__generated__/block/2