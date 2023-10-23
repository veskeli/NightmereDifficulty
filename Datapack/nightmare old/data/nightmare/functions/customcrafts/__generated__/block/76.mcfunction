#built using mc-build (https://github.com/mc-build/mc-build)

function nightmare:summonitem/wandofpoison
execute as @s run playsound block.anvil.use block @a[distance=..5] ~ ~ ~
kill @e[type=item,nbt={Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{emeraldwand:1b}}},sort=nearest]
kill @s