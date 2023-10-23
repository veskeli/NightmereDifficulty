#built using mc-build (https://github.com/mc-build/mc-build)

execute run gamerule commandBlockOutput false
tellraw @a {"text":"\n "}
tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
tellraw @a {"text":"\n "}
execute as @a run function nightmare:nightmareversion