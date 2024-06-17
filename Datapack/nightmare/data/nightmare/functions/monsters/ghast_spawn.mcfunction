# Generated with MC-Build

# Volatile
execute if predicate nightmare:10change run data merge entity @e[type=ghast,tag=!nightmare,limit=1] {ExplosionPower:6,Tags:["nightmare","nightmare_volatile_ghast"],CustomName:'{"text":"Volatile Ghast"}'}
# Vanilla
data merge entity @e[type=ghast,tag=!nightmare,limit=1] {ExplosionPower:3,Tags:["nightmare"]}