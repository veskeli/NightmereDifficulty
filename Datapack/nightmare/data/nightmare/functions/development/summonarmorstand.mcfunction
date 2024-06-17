# Generated with MC-Build

# Spawn armorstand with summon settings
summon minecraft:armor_stand ~ ~1 ~ {CustomName:'{"text":"SummonCircle_Vindicator"}',Invisible:1b,Invulnerable:1b}
# set scoreboar timer
scoreboard players set @e[type=minecraft:armor_stand,name="SummonCircle_Vindicator",limit=1,sort=nearest] Nightmare_SummonCircle_Vindicator 50