import ./macros/customcrafting.mcm

function load{
    tellraw @a ["",{"text":"Nether addon loaded!","color":"yellow"}]
    scoreboard objectives add Nightmare_HeatLevel dummy
}
function tick{
    #Check teleports
    execute in minecraft:the_nether as @a if entity @s[nbt={Dimension:"minecraft:overworld"}] run execute as @s run function nightmare_nether_survival:teleport_to_nether
    execute in minecraft:the_nether as @a if entity @s[nbt={Dimension:"minecraft:the_end"}] run execute as @s run function nightmare_nether_survival:teleport_to_nether

    #Check crafts
    function nightmare_nether_survival:custom_crafting/check_crafts
    #Check tools
    function nightmare_nether_survival:tools/check_iron_tools
}
function teleport_to_nether{
    fill -3 85 -3 3 90 3 air
    fill -3 85 -3 3 85 3 obsidian
    tp 0 86 0
    execute in minecraft:the_nether run spawnpoint @s 0 86 0
    title @s times 20 100 20
    title @s title {"text":"No Escape from the Abyss","color":"gray"}
}
dir custom_crafting{
    function check_crafts{
        #Soul forge
        function nightmare_nether_survival:custom_crafting/soul_forge/soul_forge_check
    }
    dir soul_forge{
        function soul_forge_check{
            #gravel to copper
            soul_forge_smelt "minecraft:gravel" "create:copper_nugget" 1
            #basalt to zinc
            soul_forge_smelt "minecraft:quartz" "create:zinc_nugget" 4
            #blackstone to stone
            soul_forge_smelt "minecraft:blackstone" "minecraft:stone" 1
            #basalt to andesite
            soul_forge_smelt "minecraft:basalt" "minecraft:andesite" 1
            #
            soul_forge_smelt "minecraft:soul_sand" "minecraft:sand" 1
            #kelp
            soul_forge_smelt "minecraft:twisting_vines" "minecraft:dried_kelp" 1
        }
        function soultest{
            execute if block ~ ~ ~-1 soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
            execute if block ~ ~ ~1 soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
            execute if block ~-1 ~ ~ soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
            execute if block ~1 ~ ~ soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
            LOOP(2,i){
                execute if block ~-1 ~<%i%> ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~ ~<%i%> ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~1 ~<%i%> ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~-1 ~<%i%> ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~ ~<%i%> ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~1 ~<%i%> ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~-1 ~<%i%> ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~ ~<%i%> ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
                execute if block ~1 ~<%i%> ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            }
            execute if block ~-1 ~-1 ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~ ~-1 ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~1 ~-1 ~-1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~-1 ~-1 ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~ ~-1 ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~1 ~-1 ~ air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~-1 ~-1 ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~ ~-1 ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
            execute if block ~1 ~-1 ~1 air run scoreboard players remove @s Nightmare_Item_Ray_Return 1
        }
        #Template
        dir templates{
            function return_test_1{
                execute if block ~ ~ ~-1 soul_fire run return 1
                execute if block ~ ~ ~1 soul_fire run return 1
                execute if block ~-1 ~ ~ soul_fire run return 1
                execute if block ~1 ~ ~ soul_fire run return 1

                return 0
            }
            function add_score_test{
                execute if block ~ ~ ~-1 soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
                execute if block ~ ~ ~1 soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
                execute if block ~-1 ~ ~ soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
                execute if block ~1 ~ ~ soul_fire run scoreboard players add @s Nightmare_Item_Ray_Return 1
            }
        }
    }
    dir crafting_table{
        function grave_digger{
            nether_customcrafting grave_digger
        }
    }
    dir give_items{
        function grave_digger{
            give @p wooden_shovel{display:{Name:'{"text":"Grave digger","color":"dark_blue"}',Lore:['{"text":"Revive player with 3 hearts"}']},grave_digger:1b} 1
        }
    }
}
dir tools{
    function check_iron_tools{
        scoreboard players reset @a Nightmare_HeatLevel
        execute as @a[nbt={Inventory:[{id:"minecraft:iron_helmet",Slot:103b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
        execute as @a[nbt={Inventory:[{id:"minecraft:iron_chestplate",Slot:102b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
        execute as @a[nbt={Inventory:[{id:"minecraft:iron_leggings",Slot:101b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
        execute as @a[nbt={Inventory:[{id:"minecraft:iron_boots",Slot:100b}]}] run scoreboard players add @s Nightmare_HeatLevel 2
        execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_helmet",Slot:103b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
        execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_chestplate",Slot:102b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
        execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_leggings",Slot:101b}]}] run scoreboard players add @s Nightmare_HeatLevel 1
        execute as @a[nbt={Inventory:[{id:"minecraft:chainmail_boots",Slot:100b}]}] run scoreboard players add @s Nightmare_HeatLevel 1

        #execute as @a[scores={Nightmare_HeatLevel=1..2}] run block{
            #title @s actionbar {"text":"You are feeling warm"}
        #}
        execute as @a[scores={Nightmare_HeatLevel=3..}] run block{
            title @s actionbar {"text":"You are hot"}
            effect give @s slowness 3 0
        }
    }
}

function custom_func{
    data merge entity @e[type=piglin_brute,limit=1,sort=nearest] {ArmorItems:[{id:"minecraft:netherite_boots",Count:1b,tag:{Trim:{material:"minecraft:quartz",pattern:"minecraft:coast"}}},{id:"minecraft:netherite_leggings",Count:1b,tag:{Trim:{material:"minecraft:quartz",pattern:"minecraft:coast"}}},{id:"minecraft:netherite_chestplate",Count:1b,tag:{Trim:{material:"minecraft:quartz",pattern:"minecraft:coast"}}},{id:"minecraft:wither_skeleton_skull",Count:1b}]}
}