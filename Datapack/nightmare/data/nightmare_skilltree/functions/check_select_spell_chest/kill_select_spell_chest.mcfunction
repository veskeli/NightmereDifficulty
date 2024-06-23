# Generated with MC-Build

say removed select spell chest
tp @s ~ -500 ~
data merge entity @s {Items:[]}
tag @e[tag=selecting_spell,limit=1,sort=nearest] remove selecting_spell
kill @s