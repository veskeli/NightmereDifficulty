# Generated with MC-Build

#Summon vindicator
execute at @s run summon minecraft:vindicator ~ ~ ~ {CustomName:"\"Summoned vindicator\"",CustomNameVisible:0b}
#Spawn particle
execute at @s run particle cloud ~ ~ ~ 0 0 0 0.1 100
#kill executing entity (Should be armorstand)
kill @s