#built using mc-build (https://github.com/mc-build/mc-build)

function nightmare:summonitem/emeraldwand
function nightmare:summonitem/weaknesscore
execute as @s run playsound block.grindstone.use block @a[distance=..5] ~ ~ ~
kill @s