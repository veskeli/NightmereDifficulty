#Nightmare Difficulty Generated

execute if predicate nightmare:50change run execute as @e[type=enderman,tag=!nightmare,limit=1,predicate=nightmare:overworldcheck] run function nightmare:monsters/mini_bosses/spectral_phantom
execute as @e[type=enderman,tag=!nightmare,limit=1,predicate=nightmare:overworldcheck] run data merge entity @s {Tags:["nightmare"]}