#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:10change] at @s run function nightmare:monsters/__generated__/block/60
execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:25change] at @s run function nightmare:monsters/__generated__/block/61
execute as @e[type=vindicator,tag=!Cavedwellerskin] if entity @s[tag=Cavedweller] run function nightmare:monsters/__generated__/block/62
execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:25change] at @s run function nightmare:monsters/__generated__/block/63
execute as @e[type=enderman,limit=1,tag=!nightmare] run tag @s add nightmare