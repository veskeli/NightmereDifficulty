#built using mc-build (https://github.com/mc-build/mc-build)

function nightmare:summonitem/wandofweakening
function nightmare:summonitem/upgradecore
execute as @s run playsound block.grindstone.use block @a[distance=..5] ~ ~ ~
kill @s