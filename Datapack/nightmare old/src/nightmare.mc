import ./macros/statuseffect.mcm
import ./macros/setstatuseffect.mcm
import ./macros/killbosshost.mcm
import ./macros/manacost.mcm
import ./macros/customcrafting.mcm
import ./macros/applymotion.mcm
import ./macros/wands.mcm

function nightmareversion{
    tellraw @s ["",{"text":"Nightmare","bold":true,"color":"red"},{"text":" version: "},{"text":"0.2.4.1","underlined":true,"color":"yellow"},{"text":"\n"},{"text":"Mobs and wands 2","color":"aqua"},{"text":" update"}]
}

function load{

    execute run gamerule commandBlockOutput false

    scoreboard objectives add currentevent dummy
    scoreboard players add $overworld currentevent 0
    #0 = no event

    #score
    scoreboard objectives add steps dummy
    scoreboard objectives add fireExpended dummy
    #effects
    scoreboard objectives add slowfalleffect dummy
    scoreboard objectives add jumpboost2_effect dummy
    scoreboard objectives add speedboyboots_effect dummy
    scoreboard objectives add haste2_effect dummy
    #gliders
    scoreboard objectives add basicgliderDurability dummy
    scoreboard objectives add basicglidereffect dummy
    scoreboard objectives add basicgliderCharge dummy

    scoreboard objectives add advancedgliderDurability dummy
    scoreboard objectives add advancedglidereffect dummy
    scoreboard objectives add advancedgliderCharge dummy

    scoreboard objectives add teleportarrowowner dummy
    scoreboard objectives add teleportskeletonarrowowner dummy
    scoreboard players set $total teleportskeletonarrowowner 1

    scoreboard objectives add NMARROW_x1 dummy
    scoreboard objectives add NMARROW_y1 dummy
    scoreboard objectives add NMARROW_z1 dummy

    scoreboard objectives add NMARROW_x2 dummy
    scoreboard objectives add NMARROW_y2 dummy
    scoreboard objectives add NMARROW_z2 dummy

    scoreboard objectives add Nightmare_NetherWeakensTitle dummy

    #magic
    function nightmare:manasystem/setupmana
    function nightmare:idsystem/setupid

    #Bossbars
    bossbar add bloodking {"text":"Blood king","color":"red","bold":true}
    bossbar set bloodking color red

    #schedule
    schedule function nightmare:effects/poisoncreepereffect 1s
    schedule function nightmare:effects/speedboyeffect 0.5s

    #tellraw @a {"text": "Nightmere difficulty loaded!","color": "#FF4A00"}
    tellraw @a {"text":"\n "}
    tellraw @a ["",{"text":"Nightmare difficulty loaded!","color":"red"},{"text":" ["},{"text":"Open Settings","color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:settings/settings"}},{"text":"]"}]
    tellraw @a {"text":"\n "}
    execute as @a run function nightmare:nightmareversion
}

function tick{
    #Join system
    execute as @a[tag=!joined] run block{
        tag @s add joined
        execute as @s run function nightmare:nightmareversion
    }

    #Id system
    function nightmare:idsystem/updateid
    
    #magic
    function nightmare:manasystem/updatemana

    #No event overworld enemies
    execute if score $overworld currentevent matches 0 run function nightmare:no_event_overworld_enemies

    #Ghast
    execute if score $nether currentevent matches 0 run function nightmare:monsters/ghast_spawn

    #Iron Gollum
    function nightmare:monsters/irongloem_spawn

    #Raid 3
    function nightmare:custom_monsters/raid3
    #Raid 4
    function nightmare:custom_monsters/raid4
    #Raid 5
    function nightmare:custom_monsters/raid5

    #pillager
    function nightmare:monsters/pillager_spawn

    #vindicator
    function nightmare:monsters/vindicator_spawn
    function nightmare:custom_monsters/tntvindicator

    #mini boss
    function nightmare:monsters/boss_spawn

    #Arrows
    #execute as @e[type=arrow,tag=!nightmerearrow,limit=1] at @s if entity @e[type=skeleton,distance=..1,limit=1] run tellraw @a {"text":"Arrow!","color":"red"}
    #execute as @e[type=arrow,tag=nightmerearrow,limit=1] run tellraw @a {"text":"Arrow!","color":"red"}
    #execute as @e[type=arrow,tag=!nightmerearrow] at @s run particle soul_fire_flame ~ ~ ~
    #execute as @e[type=arrow,tag=!nightmerearrow,nbt={inBlockState:{}}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 400
    #execute as @e[type=arrow,tag=!nightmerearrow,nbt={inBlockState:{}}] at @s run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:50,CustomName:'{"text":"Nuke arrow"}'}
    #execute as @e[type=arrow,tag=!nightmerearrow,nbt={inBlockState:{}}] run kill @s
    #execute as @e[type=minecraft:arrow,nbt={inGround:0b}] at @s run tag @e[distance=..4,type=player] add playerarrow
    #execute as @e[type=minecraft:arrow,nbt={inGround:0b}] at @s if entity @e[distance=..4,type=skeleton] run tag @s add arroweffect
    #execute as @e[type=arrow,tag=arroweffect] at @s if entity @e[distance=..5,type=skeleton,limit=1] at @e[distance=..5,type=skeleton,limit=1] run particle soul_fire_flame ~ ~ ~ .5 .5 .5 0 200
    #execute as @e[type=arrow,tag=arroweffect] at @s run kill @e[distance=..5,type=skeleton,limit=1]
    #execute as @e[type=arrow,tag=arroweffect] run kill @s
    #execute as @e[type=minecraft:arrow,nbt={inGround:0b}] at @s run tag @e[distance=..4,type=player] add playerarrow

    #execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=player,distance=..6,sort=nearest,limit=1] run tag @s add arroweffect
    #execute as @e[type=minecraft:arrow,nbt={inBlockState:{}},tag=arroweffect] at @s run function nightmare:effects/firebomb
    #execute as @e[type=minecraft:arrow,nbt={ inBlockState:{}},tag=arroweffect] run kill @s
    
    execute at @e[tag=ritualspot] run function nightmare:particles/outercircle
    
    #If player in air
    tag @a remove InAir
    #execute at @a ~ ~ ~ detect ~ ~-1 ~ air 0 tag @s add InAir
    #execute as @a at @s if block ~ ~-1 ~ air run tag @s add InAir
    execute as @a[nbt={OnGround:0b}] run tag @s add InAir

    #Gliders
    execute as @a run function nightmare:glidereffects/basicglider
    execute as @a run function nightmare:glidereffects/advancedglider

    #arrows -------------------
    #phantomking
    function nightmare:arroweffects/phantomking
    #teleport
    function nightmare:arroweffects/teleportarrow
    #Fire arrows
    function nightmare:arroweffects/firearrow
    #if null arrow
    execute as @e[type=arrow,tag=!arroweffect] run tag @s add arroweffect

    #Set Status effects
    function nightmare:effects/setstatuseffects

    #Status effects
    function nightmare:effects/statuseffects
    
    #Wands
    scoreboard objectives add wanduse minecraft.used:warped_fungus_on_a_stick 
    execute as @a if score @s wanduse matches 1.. run function nightmare:wands/checkwand
    
    #Test
    #execute as @e[tag=door] at @s run tp @s ~ ~ ~ ~.3 ~
    #execute at @e[tag=door] run function nightmare:particles/alchemymod
    scoreboard players add @a Nightmare_NetherWeakensTitle 0
    execute as @a[scores={Nightmare_NetherWeakensTitle=0}] at @s if predicate nightmare:nether run block{
        scoreboard players set @a Nightmare_NetherWeakensTitle 1
        title @s times 20 160 20
        title @s subtitle ["",{"text":"3x","color":"dark_red"},{"text":" Mana Regeneration Cooldown. "},{"text":"3x","color":"dark_red"},{"text":" Wand use time."}]
        title @s title {"text":"Nether weakens you","color":"red"}
    }
}
function no_event_overworld_enemies{
    #creeper
    function nightmare:monsters/creeper_spawn

    #Zombie
    function nightmare:monsters/zombie_spawn

    #VillagerZombie
    function nightmare:monsters/villagerzombie_spawn

    #Drowned
    function nightmare:monsters/drowned_spawn

    #Husk
    function nightmare:monsters/husk_spawn
    
    #skeleton
    function nightmare:monsters/skeleton_spawn

    #Spider
    function nightmare:monsters/spider_spawn
}

function commandfeedback{
    gamerule sendCommandFeedback true
}

dir idsystem{
    function setupid{
        scoreboard objectives add id dummy
        execute if score $total id >= 0 id run scoreboard players set $total id 1
    }
    function updateid{
        scoreboard players add @a id 0

        execute as @a[scores={id=0}] run function nightmare:idsystem/init
    }
    function init{
        scoreboard players operation @s id = $total id
        scoreboard players add $total id 1
    }
    function teleportskeletoninit{
        scoreboard players operation @s teleportskeletonarrowowner = $total teleportskeletonarrowowner
        scoreboard players add $total teleportskeletonarrowowner 1
    }
}

dir manasystem{
    function setupmana{
        scoreboard objectives add Nightmare_Mana dummy
        scoreboard objectives add Nightmare_MaxMana dummy
        scoreboard objectives add Nightmare_ManaRegneration dummy
        scoreboard objectives add Nightmare_UseDelay dummy
        execute run scoreboard players set $baseCooldown Nightmare_ManaRegneration 4
        function nightmare:potions/setuppotions
    }
    function updatemana{
        scoreboard players add @a Nightmare_MaxMana 0
        scoreboard players add @a Nightmare_ManaRegneration 0
        scoreboard players add @a Nightmare_Mana 0
        scoreboard players add @a Nightmare_UseDelay 0
        #execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wand:1b}}}] run title @s actionbar ["",{"text":"Mana:","color":"dark_aqua"},{"text":" ","color":"dark_blue"},{"score":{"name":"@s","objective":"Nightmare_Mana"},"color":"dark_green"}]
        #execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wand:1b}}},scores={Nightmare_ManaRegneration=1..,Nightmare_UseDelay=0}] run title @s actionbar ["",{"text":"Mana:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_Mana"},"color":"dark_green"},{"text":" |","color":"gold"},{"text":" Regeneration:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_ManaRegneration"},"color":"dark_green"}]
        #execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wand:1b}}},scores={Nightmare_ManaRegneration=0,Nightmare_UseDelay=1..}] run title @s actionbar ["",{"text":"Mana:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_Mana"},"color":"dark_green"},{"text":" |","color":"gold"},{"text":" Regeneration:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_UseDelay"},"color":"dark_green"}]
        execute as @a[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wand:1b}}}] run title @s actionbar ["",{"text":"Mana:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_Mana"},"color":"dark_green"},{"text":" | ","color":"gold"},{"text":"MRC:","color":"dark_aqua"},{"text":" "},{"score":{"name":"@s","objective":"Nightmare_ManaRegneration"},"color":"dark_green"},{"text":" |","color":"gold"},{"text":" Cooldown: ","color":"dark_aqua"},{"score":{"name":"@s","objective":"Nightmare_UseDelay"},"color":"dark_green"}]
        execute as @a[scores={Nightmare_MaxMana=0}] run function nightmare:manasystem/init

        function nightmare:potions/updatepotions
    }
    clock 0.1s{
        #Check max mana stuff
        scoreboard players set @a Nightmare_MaxMana 0
        scoreboard players operation @a Nightmare_MaxMana = $total Nightmare_MaxMana
        execute as @a[scores={potionofevoker=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
        execute as @a[scores={potionofillusioner=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
        execute as @a[scores={potionofwitch=1},limit=1] run scoreboard players add @s Nightmare_MaxMana 3
        execute as @a[nbt={Inventory:[{Slot:103b,tag:{weakwizardhat:1b}}]},limit=1] run scoreboard players add @s Nightmare_MaxMana 5
        execute as @a[nbt={Inventory:[{Slot:103b,tag:{lostwizardhat:1b}}]},limit=1] run scoreboard players add @s Nightmare_MaxMana 10
        execute as @a if score @s Nightmare_MaxMana < @s Nightmare_Mana run scoreboard players operation @s Nightmare_Mana = @s Nightmare_MaxMana
    }
    function init{
        scoreboard players operation @s Nightmare_MaxMana = $total Nightmare_MaxMana
    }
    function startcooldown{
        execute as @s run scoreboard players operation @s Nightmare_ManaRegneration = $baseCooldown Nightmare_ManaRegneration
    }
    clock 0.5s{
        execute run scoreboard players set $total Nightmare_MaxMana 15
        execute as @a[scores={Nightmare_ManaRegneration=1..}] run block{
            scoreboard players remove @s Nightmare_ManaRegneration 1
        }
    }
    clock 0.1s{
        execute as @a[scores={Nightmare_ManaRegneration=0}] run block{
            execute if score @s Nightmare_Mana < @s Nightmare_MaxMana run scoreboard players add @s Nightmare_Mana 1
        }
        execute as @a[scores={Nightmare_UseDelay=1..}] run block{
            scoreboard players remove @s Nightmare_UseDelay 1
        }
    }
}
dir wands{
    function getwandbookupdate{
        clear @s written_book{title:"Nightmare wands",author:""}
        execute as @s run function nightmare:giveitem/wandbook
    }
    function checkwand{
        scoreboard players reset @s wanduse
        #/give @p warped_fungus_on_a_stick{torchwand:1b,display:{Name:'[{"text":"Magic torch wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"1","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Shoot torches from inventory","color":"yellow"}]']},HideFlags:32} 1
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{torchwand:1b}}}] at @s run function nightmare:wands/torchwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{emeraldwand:1b}}}] at @s run function nightmare:wands/emeraldwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{basicarrowwand:1b}}}] at @s run function nightmare:wands/basicarrowwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{upgradedbasicarrowwand:1b}}}] at @s run function nightmare:wands/upgradedbasicarrowwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{arrowwand:1b}}}] at @s run function nightmare:wands/arrowwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{upgradedarrowwand:1b}}}] at @s run function nightmare:wands/upgradedarrowwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{stonepillar:1b}}}] at @s run function nightmare:wands/stonepillar/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wandofweakening:1b}}}] at @s run function nightmare:wands/wandofweakening/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wandofweakening2:1b}}}] at @s run function nightmare:wands/wandofweakening2/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{summonertest:1b}}}] at @s run function nightmare:wands/summonertest/start_raycast

        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{illagerwand:1b}}}] at @s run function nightmare:wands/illagerwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{illagerwand2:1b}}}] at @s run function nightmare:wands/illagerwand2/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wandofpoison:1b}}}] at @s run function nightmare:wands/wandofpoison/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wandofpoison2:1b}}}] at @s run function nightmare:wands/wandofpoison2/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{wandofrope:1b}}}] at @s run function nightmare:wands/wandofrope/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{riderwand:1b}}}] at @s run function nightmare:wands/riderwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{nukewand:1b}}}] at @s run function nightmare:wands/nukewand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{raidwand:1b}}}] at @s run function nightmare:wands/raidwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{tormentedwand:1b}}}] at @s run function nightmare:wands/tormentedwand/start_raycast
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{handyemeraldwand:1b}}}] at @s run function nightmare:wands/handyemeraldwand/start_raycast

        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{ritualspotwand:1b}}}] at @s run function nightmare:wands/ritualspotwand/start_raycast

        #potions
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{potionofillusioner:1b}}}] at @s run function nightmare:potions/potionofillusioner
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{potionofwitch:1b}}}] at @s run function nightmare:potions/potionofwitch
        execute if entity @s[nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",tag:{potionofevoker:1b}}}] at @s run function nightmare:potions/potionofevoker
    }
    dir normal{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=1..}] run block{
                scoreboard players set @s Nightmare_ManaRegneration 1
                scoreboard players remove @s Nightmare_Mana 1
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/torchwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/torchwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/torchwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/torchwand/collide_block
        }
        function collide{
            execute at @s run particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            function nightmare:wands/torchwand/torchwand
        }
        function torchwand{
            #clear @p torch 1
            execute positioned ~ ~ ~ run particle dust 0.816 1 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 50
            #fill ~ ~1 ~ ~ ~1 ~ torch replace air
            execute if block ~ ~ ~ air run setblock ~ ~ ~ torch
        }
    }
    dir stonepillar{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=10..}] run block{
                manacost 10 4 10
                tag @s add raycasting
                execute run function nightmare:wands/stonepillar/raycast
                tag @s remove raycasting
                scoreboard objectives add PillarWand dummy
            }
        }
        function raycast{
            scoreboard players set @s PillarWand 5

        }
        clock 0.1s{
            execute as @a[scores={PillarWand=1..}] run block{
                execute if block ~ ~2 ~ air run block{
                    execute at @s run teleport @s ~ ~1 ~
                    execute at @s run setblock ~ ~-1 ~ stone
                }
                execute run scoreboard players remove @s PillarWand 1
            }
        }
    }
    dir summonertest{
        function start_raycast{
            scoreboard objectives add summonertest dummy
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=1..}] run block{
                scoreboard players set @s Nightmare_ManaRegneration 1
                scoreboard players remove @s Nightmare_Mana 1
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/summonertest/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            #execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/summonertest/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..1] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..50 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/summonertest/raycast
            execute if score .distance steps matches ..50 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/summonertest/collide_block
            execute if score .distance steps matches 51 run block{
                particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
                scoreboard players add .distance steps 1001
                summon wolf ~ ~ ~ {CustomNameVisible:0b,DeathLootTable:"empty",Health:6f,Tags:["minion"],CustomName:'{"text":"Minion","color":"green"}',Attributes:[{Name:generic.max_health,Base:6},{Name:generic.attack_damage,Base:6}]}
                execute as @e[type=wolf,sort=nearest,limit=1] run block{
                    scoreboard players set @s summonertest 30
                    data modify entity @s Owner set from entity @a[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{summonertest:1b}}}] UUID
                    tag @s add minion
                    tag @s add nightmare
                }
            }
        }
        function collide_block{
            execute at @s run particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
            particle dust 1 0.318 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 10
            scoreboard players add .distance steps 1001
            summon wolf ~ ~ ~ {CustomNameVisible:0b,DeathLootTable:"empty",Health:6f,Tags:["minion"],CustomName:'{"text":"Minion","color":"green"}',Attributes:[{Name:generic.max_health,Base:6},{Name:generic.attack_damage,Base:6}]}
            execute as @e[type=wolf,sort=nearest,limit=1] run block{
                scoreboard players set @s summonertest 30
                data modify entity @s Owner set from entity @a[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{summonertest:1b}}}] UUID
                tag @s add minion
                tag @s add nightmare
            }
        }
        clock 1s{
            execute as @e[tag=minion] run block{
                scoreboard players remove @s summonertest 1
                execute as @s[scores={summonertest=0}] run block{
                    kill @s
                }
            }
        }
    }
    dir raidwand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=4..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 4 4 5
                execute at @s run block{
                    playsound entity.evoker.prepare_wololo master @a ~ ~ ~ 
                    effect give @e[type=vindicator,distance=..80] glowing 7
                    effect give @e[type=pillager,distance=..80] glowing 7
                    effect give @e[type=witch,distance=..80] glowing 7
                    effect give @e[type=ravager,distance=..80] glowing 7
                    effect give @e[type=illusioner,distance=..80] glowing 7
                    effect give @e[type=evoker,distance=..80] glowing 7
                }
            }
        }
    }
    dir basicarrowwand{
        #/give @p warped_fungus_on_a_stick{display:{Name:'[{"text":"Basic Arrow Wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Short","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"50% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,basicarrowwand:1b} 1
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run tellraw @s {"text":"No arrows in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=4..}] if entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] at @s run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 4 4 5
                execute if predicate nightmare:50change run clear @s arrow 1
                #tag @s add raycasting
                execute as @s anchored eyes positioned ^ ^ ^ run function nightmare:wands/basicarrowwand/raycast
                #tag @s remove raycasting
                #scoreboard players reset .distance steps
            }
        }
        function raycast{
            summon arrow ^ ^ ^0.5 {life:500,damage:1.3d,Tags:["arroweffect","player"],CustomName:'{"text":"Basic arrow Wand Projectile","color":"dark_blue"}'}
            
            playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2

            execute as @e[type=arrow,tag=player,tag=!motion] at @s rotated as @p run function nightmare:wands/basicarrowwand/motion
        }
        function motion{
            applymotion 0.03 0.0000008
        }
    }
    dir upgradedbasicarrowwand{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Upgraded Basic Arrow Wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Medium","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"50% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,upgradedbasicarrowwand:1b} 1
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run tellraw @s {"text":"No arrows in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] if entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 5
                execute if predicate nightmare:50change run clear @s arrow 1
                #tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/upgradedbasicarrowwand/raycast
                #tag @s remove raycasting
                #scoreboard players reset .distance steps
            }
        }
        function raycast{
            summon arrow ^ ^ ^0.5 {life:500,damage:1.2d,Tags:["arroweffect","player"],CustomName:'{"text":"Basic arrow Wand Projectile","color":"dark_blue"}'}
            
            playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2

            execute as @e[type=arrow,tag=player,tag=!motion] at @s rotated as @p run function nightmare:wands/upgradedbasicarrowwand/motion
        }
        function motion{
            applymotion 0.03 0.0000008
        }
    }
    dir arrowwand{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Arrow Wand","italic":false,"color":"aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"3s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Medium","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"25% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,arrowwand:1b} 1
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run tellraw @s {"text":"No arrows in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] if entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 6 5
                execute if predicate nightmare:25change run clear @s arrow 1
                #tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/arrowwand/raycast
                #tag @s remove raycasting
                #scoreboard players reset .distance steps
            }
        }
        function raycast{
            summon arrow ^ ^ ^0.5 {life:500,damage:2d,Tags:["arroweffect","player"],CustomName:'{"text":"Basic arrow Wand Projectile","color":"dark_blue"}'}
            
            playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2

            execute as @e[type=arrow,tag=player,tag=!motion] at @s rotated as @p run function nightmare:wands/arrowwand/motion
        }
        function motion{
            applymotion 0.03 0.0000008
        }
    }
    dir upgradedarrowwand{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Upgraded Arrow Wand","italic":false,"color":"aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"3s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Medium","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Pierce: ","italic":false,"color":"dark_purple"},{"text":"2","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"50% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,upgradedarrowwand:1b} 1
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run tellraw @s {"text":"No arrows in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] if entity @s[nbt={Inventory:[{id:"minecraft:arrow"}]}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 6 5
                execute if predicate nightmare:50change run clear @s arrow 1
                #tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/upgradedarrowwand/raycast
                #tag @s remove raycasting
                #scoreboard players reset .distance steps
            }
        }
        function raycast{
            summon arrow ^ ^ ^0.5 {life:500,damage:2d,PierceLevel:2b,Tags:["arroweffect","player"],CustomName:'{"text":"Basic arrow Wand Projectile","color":"dark_blue"}'}
            
            playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2

            execute as @e[type=arrow,tag=player,tag=!motion] at @s rotated as @p run function nightmare:wands/upgradedarrowwand/motion
        }
        function motion{
            applymotion 0.03 0.0000008
        }
    }
    dir tormentedwand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 10
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/tormentedwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/tormentedwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/tormentedwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/tormentedwand/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if predicate nightmare:25change run block{
                execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 1 true
                execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 1 true
                execute at @s run particle firework ~ ~0.7 ~ 1 1 1 0.4 20 force
            }
            execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
            execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir handyemeraldwand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 10
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/handyemeraldwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/handyemeraldwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/handyemeraldwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/handyemeraldwand/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if predicate nightmare:5change run block{
                execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 1 true
                execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 1 true
                execute at @s run particle firework ~ ~0.7 ~ 1 1 1 0.4 20 force
            }
            execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
            execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir emeraldwand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 10
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/emeraldwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/emeraldwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/emeraldwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/emeraldwand/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
            execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir illagerwand{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b} 1
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 10
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/illagerwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/illagerwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/illagerwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/illagerwand/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
            execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
            execute as @s run effect give @s wither 4 2
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir illagerwand2{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b} 1
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/illagerwand2/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/illagerwand2/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/illagerwand2/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/illagerwand2/collide_block
        }
        function collide{
            execute if entity @s[type=#nightmare:undead_mob] run effect give @s instant_health 1 0 true
            execute if entity @s[type=!#nightmare:undead_mob] run effect give @s instant_damage 1 0 true
            execute as @s run effect give @s wither 4 2
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 1 0.318 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.984 1 0 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir wandofweakening{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=3..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 2 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofweakening/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofweakening/collide
            scoreboard players add .distance steps 1

            #execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
            execute unless entity @s[distance=..3] run particle dust 0.22 0.22 0.22 1 ~ ~ ~ 0 0 0 0 1
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if entity @s run effect give @s weakness 15 0
            execute if entity @s run effect give @s slowness 10 0
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~ ~ 0.5 0.5 0.5 0 10
            
        }
    }
    dir wandofweakening2{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=4..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 4 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofweakening2/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofweakening2/collide
            scoreboard players add .distance steps 1

            #execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
            execute unless entity @s[distance=..3] run particle dust 0.22 0.22 0.22 1 ~ ~ ~ 0 0 0 0 1
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening2/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofweakening2/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute at @s run summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:1,Radius:4f,Duration:80,Effects:[{Id:2,Amplifier:0b,Duration:80},{Id:18,Amplifier:0b,Duration:140}]}
            #summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:5,Radius:2f,RadiusPerTick:.2f,Duration:80,Effects:[{Id:2,Amplifier:0b,Duration:200},{Id:18,Amplifier:0b,Duration:300}]}
            #playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            #execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:1,Radius:4f,Duration:80,Effects:[{Id:2,Amplifier:0b,Duration:80},{Id:18,Amplifier:0b,Duration:140}]}
            execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir wandofpoison{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=3..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 4 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofpoison/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofpoison/collide
            scoreboard players add .distance steps 1

            #execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
            execute unless entity @s[distance=..3] run particle dust 0.314 0.275 0.22 1 ~ ~ ~ 0 0 0 0 1
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofpoison/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofpoison/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute if entity @s run effect give @s wither 15 0
            playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            execute at @s run particle dust 0.2 0.412 0.212 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            execute at @s run particle dust 0.2 0.412 0.212 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
    }
    dir ritualspotwand{
        function start_raycast{
            say ded
            tag @s add raycasting
            execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/ritualspotwand/raycast
            tag @s remove raycasting
            scoreboard players reset .distance steps
        }
        function raycast{
            scoreboard players add .distance steps 1

            #execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
            execute unless entity @s[distance=..3] run particle dust 0.506 0.314 0.129 1 ~ ~ ~ 0 0 0 0 1
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/ritualspotwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/ritualspotwand/collide_block
        }
        function collide_block{
            clear @a[limit=1,sort=nearest] warped_fungus_on_a_stick{ritualspotwand:1b} 1
            execute positioned ~ ~1 ~ align xyz run summon armor_stand ~.05 ~ ~ {Tags:["ritualspot"],Invisible:1}
            execute at @s run particle dust 1 0 0 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
    }
    dir wandofpoison2{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=4..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 6 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofpoison2/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofpoison2/collide
            scoreboard players add .distance steps 1

            #execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal
            execute unless entity @s[distance=..3] run particle dust 0.314 0.275 0.22 1 ~ ~ ~ 0 0 0 0 1
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofpoison2/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofpoison2/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute at @s run summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:40,Radius:4f,Duration:80,Effects:[{Id:20,Amplifier:0b,Duration:300}]}
            #summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:5,Radius:2f,RadiusPerTick:.2f,Duration:80,Effects:[{Id:2,Amplifier:0b,Duration:200},{Id:18,Amplifier:0b,Duration:300}]}
            #playsound entity.arrow.hit_player player @a[distance=..30] ~ ~ ~ 0.1
            #execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~0.7 ~ 0.5 0.5 0.5 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            summon area_effect_cloud ~ ~ ~ {ReapplicationDelay:40,Radius:4f,Duration:80,Effects:[{Id:20,Amplifier:0b,Duration:300}]}
            execute at @s run particle dust 0.392 0.392 0.392 2 ~ ~ ~ 0.5 0.5 0.5 0 10
        }
    }
    dir wandofrope{
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] run tellraw @s {"text":"No lead in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[nbt={Inventory:[{id:"minecraft:lead"}]}] if entity @s[scores={Nightmare_Mana=1..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 1 1 1
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/wandofrope/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/wandofrope/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..100 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/wandofrope/raycast
            execute if score .distance steps matches ..100 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run execute positioned ^ ^ ^-0.1 run function nightmare:wands/wandofrope/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute at @s run particle dust 0.514 0.341 0.263 2 ~ ~1 ~ 0.1 0.1 0.1 0 3
            clear @p lead 1
            data modify entity @s Leash.UUID set from entity @p UUID
        }
        function collide_block{
            
        }
    }
    dir riderwand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/riderwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/riderwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..200 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/riderwand/raycast
            execute if score .distance steps matches ..200 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run execute positioned ^ ^ ^-0.1 run function nightmare:wands/riderwand/collide_block
        }
        function collide{
            scoreboard players add .distance steps 1000
            execute at @s run particle dust 0.514 0.341 0.263 2 ~ ~1 ~ 0.1 0.1 0.1 0 3
            data modify entity @s Passengers set from entity @p UUID
        }
        function collide_block{
            
        }
    }
    dir nukewand{
        function start_raycast{
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[scores={Nightmare_Mana=5..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 5 4 5
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/nukewand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/nukewand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/nukewand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run execute positioned ^ ^ ^-0.1 run function nightmare:wands/nukewand/collide_block
        }
        function collide{
            #scoreboard players add .distance steps 1000
            #execute at @s run particle dust 0.514 0.341 0.263 2 ~ ~1 ~ 0.1 0.1 0.1 0 3
            #data modify entity @s Passengers set from entity @p UUID
        }
        function collide_block{
            summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:10,CustomName:'{"text":"Nuke"}'}
            execute as @s run tag @e[distance=..1,limit=1,sort=nearest,type=creeper] add nightmare
        }
    }
    dir torchwand{
        #/give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Magic torch wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"1","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Shoot torches from inventory","color":"yellow"}]']},wand:1b,torchwand:1b} 1
        function start_raycast{
            execute unless entity @s[nbt={Inventory:[{id:"minecraft:torch"}]}] run tellraw @s {"text":"No torches in inventory","color":"#F38A8A"}
            execute if entity @s[scores={Nightmare_UseDelay=0}] if entity @s[nbt={Inventory:[{id:"minecraft:torch"}]}] if entity @s[scores={Nightmare_Mana=1..}] run block{
                #Manacost [Manacost] [ManaRegeneration] [WandCooldown]
                manacost 1 1 1
                tag @s add raycasting
                execute anchored eyes positioned ^ ^ ^ run function nightmare:wands/torchwand/raycast
                tag @s remove raycasting
                scoreboard players reset .distance steps
            }
        }
        function raycast{
            execute as @e[dx=0,type=!#nightmare:not_mob,tag=!raycasting] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] positioned ~0.99 ~0.99 ~0.99 run function nightmare:wands/torchwand/collide
            scoreboard players add .distance steps 1

            execute unless entity @s[distance=..3] run particle minecraft:smoke ~ ~ ~ 0 0 0 0 1 normal

            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ if block ~ ~ ~ #nightmare:raycast_pass run function nightmare:wands/torchwand/raycast
            execute if score .distance steps matches ..1000 positioned ^ ^ ^0.1 rotated ~ ~ unless block ~ ~ ~ #nightmare:raycast_pass run execute positioned ^ ^ ^-0.1 run function nightmare:wands/torchwand/collide_block
        }
        function collide{
            execute at @s run particle dust 1 0.318 0 2 ~ ~1 ~ 0.1 0.1 0.1 0 10
        }
        function collide_block{
            #particle explosion ~ ~ ~ 0 0 0 0 5
            function nightmare:wands/torchwand/torchwand
        }
        function torchwand{
            execute if block ~ ~ ~ air unless block ~ ~-1 ~ #nightmare:raycast_pass run block{
                setblock ~ ~ ~ torch
                execute positioned ~ ~ ~ run particle dust 0.816 1 0 2 ~ ~1 ~ 0.5 0.5 0.5 0 50
                playsound entity.arrow.hit_player player @s ~ ~ ~ 0.4
                clear @p torch 1
            }
        }
    }
}

dir potions{
    function setuppotions{
        scoreboard objectives add potionofillusioner dummy
        scoreboard objectives add potionofwitch dummy
        scoreboard objectives add potionofevoker dummy
    }
    function updatepotions{
        scoreboard players add @a potionofillusioner 0
        scoreboard players add @a potionofwitch 0
        scoreboard players add @a potionofevoker 0
    }
    function potionofillusioner{
        maxmanapotion potionofillusioner 3
    }
    function potionofwitch{
        maxmanapotion potionofwitch 3
    }
    function potionofevoker{
        maxmanapotion potionofevoker 3
    }
}

dir monsters{
    function ghast_spawn{
        #fireball
        execute as @e[type=fireball,tag=!nightmare,limit=1] at @s if entity @e[type=ghast,distance=..5,sort=nearest,limit=1,tag=shotgun] run block{
            tag @s add shotgun
            #execute rotated as @s run summon fireball ^ ^ ^5
            execute rotated as @s run execute positioned 0. 0 0. run summon fireball ^ ^ ^.1 {Tags:["fireball"]}
            execute as @e[tag=fireball,sort=nearest] run data modify entity @s power set from entity @s Pos
            tp @e[tag=fireball,sort=nearest] ~3 ~1 ~
            tag @e[tag=fireball,sort=nearest] add shotgun
            tag @e[tag=fireball,sort=nearest] remove fireball
            execute rotated as @s run execute positioned 0. 0 0. run summon fireball ^ ^ ^.1 {Tags:["fireball"]}
            execute as @e[tag=fireball,sort=nearest] run data modify entity @s power set from entity @s Pos
            tp @e[tag=fireball,sort=nearest] ~-3 ~-1 ~
            tag @e[tag=fireball,sort=nearest] add shotgun
            tag @e[tag=fireball,sort=nearest] remove fireball
        }
        
        data merge entity @e[type=fireball,tag=!nightmare,limit=1] {ExplosionPower:3,Tags:["nightmare"]}
        tag @e[type=fireball,tag=!nightmare] add nightmare
        #ghast spawn
        execute if predicate nightmare:50change run tag @e[type=ghast,tag=!nightmare,limit=1] add shotgun 
        tag @e[type=ghast,tag=!nightmare] add nightmare
    }
    function creeper_spawn{
        execute if predicate nightmare:instacreeper run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {Health:15f,Attributes:[{Name:"generic.movement_speed",Base:0.28}],powered:1b,Fuse:2,Tags:["nightmare"]}
        execute if predicate nightmare:bigboycreeper run data merge entity @e[type=creeper,tag=!nightmare,limit=1] {Tags:["nightmare"],Attributes:[{Name:"generic.movement_speed",Base:0.24}],ExplosionRadius:6,Fuse:35}
        #execute if predicate nightmare:10change run execute as @e[type=creeper,tag=!nightmare,limit=1] run function nightmare:monsters/poisoncreeper
        data merge entity @e[type=creeper,tag=!nightmare,limit=1] {ExplosionRadius:5,Tags:["nightmare"]}

        execute as @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27b,Amplifier:16b}]}] at @s run function nightmare:effects/poisonbomb
        kill @e[type=minecraft:area_effect_cloud,nbt={Effects:[{Id:27b,Amplifier:16b}]}]
    }
    function zombie_spawn{
        #execute if predicate nightmare:bossbaby run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CustomNameVisible:1b,CanPickUpLoot:1b,IsBaby:1b,Tags:["nightmare"],CustomName:'{"text":"Boss Baby","color":"red","bold":true}',Attributes:[{Name:generic.max_health,Base:40},{Name:generic.follow_range,Base:80},{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}
        #Speed or strong
        execute if predicate nightmare:25change run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalzombie
        execute if predicate nightmare:raining run data merge entity @e[type=zombie,tag=!nightmare,limit=1] {CanBreakDoors:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:trident",Count:1b},{}],HandDropChances:[0.000F,0.085F],Attributes:[{Name:generic.movement_speed,Base:0.3},{Name:zombie.spawn_reinforcements,Base:1}]}
        #execute if predicate nightmare:bloodkingchange run execute as @e[type=zombie,tag=!nightmare,limit=1] run function nightmare:monsters/bloodking
        execute as @e[type=zombie,tag=!nightmare,limit=1] run data merge entity @s {Attributes:[{Base:9.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"]}
        
        #bloodking
        execute at @e[type=zombie,tag=bloodking,nbt={HurtTime:10s}] run particle dust 1 0 0 5 ~ ~1 ~ 1 .6 1 0 50
        execute if predicate nightmare:50change at @e[type=zombie,tag=bloodking,nbt={HurtTime:10s}] if block ^ ^ ^-1 air run summon zombie ^ ^ ^-1 {Tags:["bloodkingfollower"]}
        execute run execute as @e[type=zombie,tag=bloodkingfollower,limit=1] run function nightmare:monsters/bloodkingfollower
        execute as @e[type=zombie,tag=bloodking,nbt={HurtTime:0s}] at @s if entity @p[distance=20..] run effect give @s speed 2 2

        execute run bossbar set bloodking players @a
        execute store result bossbar bloodking value run data get entity @e[tag=bloodking,limit=1] Health
        execute as @e[tag=bloodking] at @s if entity @p[distance=..30] run bossbar set minecraft:bloodking visible true
        execute as @e[tag=bloodking] at @s if entity @p[distance=30..] run bossbar set minecraft:bloodking visible false
        execute unless entity @e[tag=bloodking] run bossbar set minecraft:bloodking visible false
    }
    function villagerzombie_spawn{
        data merge entity @e[type=zombie_villager,tag=!nightmare,limit=1] {Health:30f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}
    }
    function drowned_spawn{
        #execute if predicate nightmare:speedboy run data merge entity @e[type=drowned,tag=!nightmare,limit=1] {Attributes:[{Base:5.0d,Name:"generic.attack_damage"},{Base:0.6d,Name:"generic.movement_speed"}],IsBaby:0b,CanPickUpLoot:1b,Tags:["nightmare"],CustomName:'{"text":"Speed boy"}',Name:zombie.spawn_reinforcements,Base:1}
        data merge entity @e[type=drowned,tag=!nightmare,limit=1] {Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}
    }
    function husk_spawn{
        execute if predicate nightmare:25change run execute as @e[type=husk,tag=!nightmare,limit=1] run function nightmare:monsters/customnormalhusk
        execute if predicate nightmare:bloodkingchange run execute as @e[type=husk,tag=!nightmare,limit=1] run function nightmare:monsters/bloodking
        execute as @s[type=husk,tag=!nightmare] run data merge entity @s {Attributes:[{Base:9.0d,Name:"generic.attack_damage"},{Base:0.3d,Name:"generic.movement_speed"}], CanPickUpLoot:1b,Tags:["nightmare"],CustomName:'{"text":"Better Husk"}'}
    }
    function skeleton_spawn{
        execute if predicate nightmare:sneakskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:diamond_sword",Count:1b,tag:{display:{Name:'{"text":"Sneak Attack","color":"blue"}',Lore:['{"text":"Foolish mortals","color":"blue"}']},Enchantments:[{id:"minecraft:sharpness",lvl:3s}]}}],Attributes:[{Name:generic.max_health,Base:100},{Name:generic.movement_speed,Base:0.6}]}
        #Melee skele
        execute if predicate nightmare:meleeskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Tags:["nightmare","meleeskele"],HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{Damage:0.1F}},{}]}
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:iron_axe",Count:1b,tag:{Damage:0.1F}},{}]}
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:golden_axe",Count:1b,tag:{Damage:0.1F}},{}]}
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=meleeskele,tag=!nightmare,limit=1] {Tags:["nightmare"],HandItems:[{id:"minecraft:golden_sword",Count:1b,tag:{Damage:0.1F}},{}]}

        execute if predicate nightmare:speedskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.5d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","speedboy"],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{Lore:['[{"text":"Modifier: ","color":"light_purple","italic":false},{"text":"Speed boost IV","color":"yellow"}]']},SpeedBoyBoots:1b}},{},{},{}]}

        execute if predicate nightmare:meleeskeleton run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.5d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"],HandItems:[{id:"minecraft:bow",Count:1b,tag:{Damage:0.1-0.3,Enchantments:[{id:"minecraft:flame",lvl:1s}]}}]}

        #Slowness skeleton
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","slownessskeleton"]}
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=slownessskeleton] run tag @s add slownessskeleton
        execute as @e[type=minecraft:arrow,tag=slownessskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:2,Amplifier:2b,Duration:70},{Id:15,Amplifier:1b,Duration:50}]}
        execute as @e[type=minecraft:arrow,tag=slownessskeleton] run tag @s add arroweffect

        #levitationskeleton skeleton
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","levitationskeleton"]}
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=levitationskeleton] run tag @s add levitationskeleton
        execute as @e[type=minecraft:arrow,tag=levitationskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:25,Amplifier:1b,Duration:60,ShowParticles:1b}]}
        execute as @e[type=minecraft:arrow,tag=levitationskeleton] run tag @s add arroweffect

        #betterlevitationskeleton skeleton
        execute if predicate nightmare:10change run data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare","betterlevitationskeleton"]}
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=betterlevitationskeleton] run tag @s add betterlevitationskeleton
        execute as @e[type=minecraft:arrow,tag=betterlevitationskeleton] at @s run data merge entity @s[tag=!arroweffect] {CustomPotionEffects:[{Id:15,Amplifier:1b,Duration:40},{Id:25,Amplifier:1b,Duration:60,ShowParticles:1b}]}
        execute as @e[type=minecraft:arrow,tag=betterlevitationskeleton] run tag @s add arroweffect

        #teleport skeleton
        execute if predicate nightmare:10change run function nightmare:custom_monsters/teleportskeleton_summon
        #execute as @e[type=skeleton,tag=nightmare,tag=teleportskeleton] run 
        function nightmare:custom_monsters/teleportskeleton

        #phantomking
        #execute if predicate nightmare:10change run execute as @e[type=skeleton,tag=!nightmare,limit=1] run function nightmare:phantomking
        #execute as @e[type=minecraft:arrow,tag=!skeletonarrow] if entity @e[distance=..10,type=skeleton,limit=1] run tellraw @a {"text":"Phantom King","color":"dark_aqua","bold":true}
        
        #execute unless entity @e[tag=phantomking] run kill @e[tag=phantomfollower]

        data merge entity @e[type=skeleton,tag=!nightmare,limit=1] {Attributes:[{Base:0.3d,Name:"generic.movement_speed"}],CanPickUpLoot:1b,Tags:["nightmare"]}
    }
    function spider_spawn{
        execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:8f,Attributes:[{Base:10.0d,Name:"generic.attack_damage"},{Base:0.1d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Attributes:[{Base:3.0d,Name:"generic.attack_damage"},{Base:0.7d,Name:"generic.movement_speed"}],Tags:["nightmare","speedboy"]}
        execute if predicate nightmare:25change run data merge entity @e[type=spider,tag=!nightmare,limit=1] {Health:20f,Attributes:[{Base:4.0d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
        data merge entity @e[type=spider,tag=!nightmare,limit=1] {Attributes:[{Base:6.0d,Name:"generic.attack_damage"},{Base:0.4d,Name:"generic.movement_speed"}],Tags:["nightmare"]}
    }
    function boss_spawn{
        #blood king
        execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:10change] at @s run block{
            killbosshost
            summon zombie ~ ~ ~ {Tags:["nightmare","bloodking"],Health:200f,IsBaby:0b,DeathLootTable:"nightmare:entities/named_boss_loot",CustomName:'{"text":"Blood king","color":"red","bold":true}',CanPickUpLoot:0b,CanBreakDoors:1b,HandItems:[{id:"minecraft:diamond_axe",Count:1b,tag:{display:{Name:'{"text":"Bloody Axe","color":"red","bold":true}',Lore:['{"text":"Blood king\'s favorite tool for defeating all his enemies."}']},Damage:0.4,Enchantments:[{id:"minecraft:sharpness",lvl:5s}]}},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16711680}}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:16711680}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],Attributes:[{Base:12.0d,Name:"generic.attack_damage"},{Name:generic.follow_range,Base:60},{Name:zombie.spawn_reinforcements,Base:1},{Name:generic.max_health,Base:200}]}
            tag @e[type=zombie,name="Blood king"] add bloodking
            tag @e[type=zombie,name="Blood king"] add nightmere
            particle dust 1 0 0 5 ~ ~1 ~ 1 .6 1 0 50 normal
        }
        #Cave dweller
        execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:25change] at @s run block{
            killbosshost
            summon vindicator ~ ~ ~ {DeathLootTable:"empty",Tags:["nightmare","Cavedweller"],CustomName:'{"text":"Cave dweller","color":"aqua"}',HandItems:[{id:"minecraft:iron_pickaxe",Count:1b,tag:{display:{Name:'{"text":"Cave dweller\'s pickaxe","color":"aqua"}'},RepairCost:100,Damage:0-0.5,Enchantments:[{id:"minecraft:fortune",lvl:5s}]}},{}],ArmorItems:[{},{},{},{id:"minecraft:golden_helmet",Count:1b,tag:{display:{Name:'{"text":"Cave dweller\'s  helmet","color":"aqua","italic":false}',Lore:['[{"text":"Modifier","color":"light_purple","italic":false},{"text":" haste 2","color":"yellow","italic":false}]']},haste2helmet:1b}}]}
            tag @e[type=vindicator,name="Cave dweller"] add Cavedweller
            tag @e[type=vindicator,name="Cave dweller"] add nightmere
            particle flame ~ ~ ~ .1 .1 .1 0 400 normal
        }
        execute as @e[type=vindicator,tag=!Cavedwellerskin] if entity @s[tag=Cavedweller] run block{
            item replace entity @s armor.head with chiseled_deepslate
            tag @s add Cavedwellerskin
        }
        #phantom king
        execute as @e[type=enderman,limit=1,tag=!nightmare,predicate=nightmare:overworldcheck,predicate=nightmare:25change] at @s run block{
            killbosshost
            summon skeleton ~ ~ ~ {CustomNameVisible:1b,Tags:["nightmare","phantomking"],DeathLootTable:"nightmare:entities/named_mini_boss_loot",CustomName:'{"text":"Phantom King","color":"dark_aqua","bold":true}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Phantom wisperer","color":"dark_aqua","bold":true}'},Enchantments:[{id:"minecraft:unbreaking",lvl:2s},{id:"minecraft:power",lvl:4s},{id:"minecraft:punch",lvl:2s}]}},{}],HandDropChances:[0.085F,0.085F],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:26367},Enchantments:[{id:"minecraft:soul_speed",lvl:3s}]}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:26367}}},{id:"minecraft:leather_helmet",Count:1b,tag:{display:{color:26367}}}],ArmorDropChances:[0.085F,0.000F,0.000F,0.000F],Attributes:[{Name:generic.max_health,Base:300},{Name:generic.follow_range,Base:60}]}
            tag @e[type=skeleton,name="Phantom King"] add phantomking
            tag @e[type=skeleton,name="Phantom King"] add nightmere
            particle soul_fire_flame ~ ~ ~ .2 .2 .2 0 400 normal
        }
        #end
        execute as @e[type=enderman,limit=1,tag=!nightmare] run tag @s add nightmare
    }
    function irongloem_spawn{
        data merge entity @e[type=iron_golem,tag=!nightmare,limit=1] {Attributes:[{Base:30.0d,Name:"generic.attack_damage"}, {Base:150.0d, Name:"generic.max_health"}],Tags:["nightmare"]}
    }
    function pillager_spawn{
        execute if predicate nightmare:25change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b},{id:"minecraft:shield",Count:1b}]}
        execute if predicate nightmare:10change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Enchantments:[{id:"minecraft:multishot",lvl:1s}]}}]}
        execute if predicate nightmare:10change run data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"],HandItems:[{id:"minecraft:crossbow",Count:1b,tag:{Enchantments:[{id:"minecraft:piercing",lvl:4s}]}}]}
        execute if predicate nightmare:25change at @e[type=pillager,limit=1,tag=!nightmare] run block{
            killbosshost
            summon illusioner ~ ~ ~
            tag @e[type=illusioner,distance=..2,sort=nearest,limit=1] add nightmare
        }
        data merge entity @e[type=pillager,limit=1,tag=!nightmare] {Tags:["nightmare"]}
    }
    function vindicator_spawn{
        execute if predicate nightmare:25change run data merge entity @e[type=vindicator,limit=1,tag=!nightmare] {Tags:["tntvin"],HandItems:[{id:"minecraft:tnt",Count:1b},{id:"minecraft:tnt",Count:1b}],HandDropChances:[0.000F,0.000F]}
        execute as @e[type=vindicator,nbt={HandItems:[{id:"minecraft:tnt",Count:1b},{}]},tag=!nightmare] run tag @s add tntvin

        execute if predicate nightmare:25change run data merge entity @e[type=vindicator,limit=1,tag=!nightmare,nbt={RaidId:5}] {Tags:["nukevin"],HandItems:[{id:"minecraft:tnt",Count:2b},{id:"minecraft:tnt",Count:1b}],ArmorItems:[{},{},{},{id:"minecraft:tnt",Count:1b}],HandDropChances:[0.000F,0.000F]}
        execute as @e[type=vindicator,nbt={HandItems:[{id:"minecraft:tnt",Count:2b},{}]},tag=!nightmare] run tag @s add nukevin

        execute as @e[type=vindicator,limit=1,tag=!nightmare] run tag @s add nightmare

        #vex
        execute as @e[type=vex,tag=!nightmare] run data merge entity @s {Attributes:[{Name:generic.max_health,Base:4}]}
        execute as @e[type=vex,tag=!nightmare] run tag @s add nightmare
    }
}
dir arroweffects{
    function phantomking{
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[type=skeleton,distance=..6,sort=nearest,limit=1,tag=phantomking] run tag @s add phantomking
        execute as @e[type=minecraft:arrow,tag=phantomking] run tag @s add arroweffect
        execute as @e[type=arrow,tag=phantomking] at @s run particle soul_fire_flame ~ ~ ~
        execute if predicate nightmare:50change as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] run function nightmare:monsters/phantomkingfollower
        execute as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] at @s run particle soul_fire_flame ~ ~ ~ .1 .1 .1 0 100
        execute as @e[type=arrow,tag=phantomking,nbt={inBlockState:{}}] run kill @s
    }
    function teleportarrow{
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:bow",Count:1b,tag:{teleportbow:1b}}}] run block{
            tag @s add arroweffect
            tag @s add teleportarrowplayer
            scoreboard players operation @s teleportarrowowner = @a[distance=..6,sort=nearest,limit=1,nbt={SelectedItem:{id:"minecraft:bow",Count:1b,tag:{teleportbow:1b}}}] id
        }
        execute as @a if score @s id = @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] teleportarrowowner run block{
            execute as @s rotated ~ ~ run teleport @s @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] 
            LOOP(10,i){
                execute at @e[tag=teleportarrowplayer,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ <%i*0.2%> <%i*0.1%> <%i*0.2%> 0 15 normal
            }
            kill @e[limit=1,type=arrow,sort=nearest,tag=teleportarrowplayer]
        }
        execute as @e[type=minecraft:arrow,tag=!arroweffect] at @s if entity @e[distance=..6,sort=nearest,limit=1,tag=teleportskeleton] run block{
            tag @s add arroweffect
            tag @s add teleportarrow
            data merge entity @s {PierceLevel:1b}
            scoreboard players operation @s teleportarrowowner = @e[distance=..6,sort=nearest,limit=1,tag=teleportskeleton] teleportskeletonarrowowner
        }
        execute as @e[type=skeleton] if score @s teleportskeletonarrowowner = @e[tag=teleportarrow,nbt={inGround:1b},limit=1] teleportarrowowner run block{
            execute as @s rotated ~ ~ run teleport @s @e[tag=teleportarrow,nbt={inGround:1b},limit=1] 
            LOOP(10,i){
                execute at @e[tag=teleportarrow,nbt={inGround:1b},limit=1] run particle dust 0.427 0 0.357 1 ~ ~ ~ <%i*0.2%> <%i*0.1%> <%i*0.2%> 0 15 normal
            }
            kill @e[limit=1,type=arrow,sort=nearest,tag=teleportarrow]
        }
    }
    function firearrow{
        execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] unless block ~ ~ ~ #firearrows:unburnable unless score @s fireExpended matches 1 if block ~ ~ ~ air run setblock ~ ~ ~ minecraft:fire
        execute as @e[type=minecraft:arrow,nbt={inGround:1b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] if block ~ ~ ~ minecraft:fire run scoreboard players set @s fireExpended 1
        execute as @e[type=minecraft:arrow,nbt={inGround:0b}] at @s if entity @s[nbt=!{Fire:-1s},nbt=!{Fire:0s}] unless block ~ ~ ~ minecraft:fire run scoreboard players set @s fireExpended 0


        execute at @e[type=arrow,nbt=!{Fire:-1s},nbt=!{Fire:0s}] run particle smoke ~ ~ ~ 0.1 0.1 0.1 0.01 5 normal
        tag @e[type=arrow,nbt={inGround:1b},nbt=!{Fire:-1s},nbt=!{Fire:0s}] add ArrowInGround
        execute at @e[tag=ArrowInGround] run particle lava ~ ~ ~ 0.8 0.8 0.8 0.01 7 force
        kill @e[tag=ArrowInGround]
    }
}
dir custom_monsters{
    function teleportskeleton_summon{
        data merge entity @s {CustomNameVisible:0b,Tags:["nightmare","teleportskeleton"],CustomName:'{"text":"Skeleton thief"}',HandItems:[{id:"minecraft:bow",Count:1b,tag:{display:{Name:'{"text":"Enderman bow","color":"dark_blue","italic":false}',Lore:['{"text":"End guardian\'s secret prototype weapon","color":"dark_blue"}']},RepairCost:100,Damage:0.1-0.8,teleportbow:1b}},{}]}
        tag @s add teleportskeleton
        tag @s add nightmare
        scoreboard players add @s teleportskeletonarrowowner 0
        execute as @s[scores={teleportskeletonarrowowner=0}] run function nightmare:idsystem/teleportskeletoninit
    }
    function tntvindicator{
        execute as @e[type=vindicator,tag=tntvin] at @s if entity @p[gamemode=survival,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
        execute as @e[type=vindicator,tag=tntvin] at @s if entity @e[type=villager,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
        execute as @e[type=vindicator,tag=tntvin] at @s if entity @e[type=iron_golem,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:3,CustomName:'{"text":"TNT Vindicator"}'}
        execute as @e[type=vindicator,tag=nukevin] at @s if entity @p[gamemode=survival,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}
        execute as @e[type=vindicator,tag=nukevin] at @s if entity @e[type=villager,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}
        execute as @e[type=vindicator,tag=nukevin] at @s if entity @e[type=iron_golem,distance=..1.6] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:6,CustomName:'{"text":"Nuke Vindicator"}'}

        execute as @e[type=ravager,tag=TNT] at @s if entity @p[gamemode=survival,distance=..1.7] run summon creeper ~ ~ ~ {Fuse:0,ExplosionRadius:10,CustomName:'{"text":"TNT ravager"}'}
    }
    function raid3{
        data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:2}] {RaidId:2,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.5},{Name:generic.attack_damage,Base:24}]}
        execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare

        execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run block{
            say more!
            execute as @s run summon vindicator ~ ~ ~
            execute as @s run tag @e[type=vindicator,distance=..1] add nightmare
        }
    }
    function raid4{
        data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:3}] {RaidId:3,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.6},{Name:generic.attack_damage,Base:32}]}
        execute if entity @e[type=ravager,nbt={Passengers:[{id:"minecraft:vindicator",HandItems:[{id:"minecraft:tnt",Count:1b},{}]}]}] at @s run tag @s add TNT
        execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare

        execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run block{
            say more!
            execute as @s run summon vindicator ~ ~ ~
            execute as @s run tag @e[type=vindicator,distance=..1] add nightmare
        }
    }
    function raid5{
        data merge entity @e[type=ravager,tag=!nightmare,limit=1,nbt={RaidId:4}] {RaidId:4,Tags:["nightmare"],Attributes:[{Name:generic.movement_speed,Base:0.7},{Name:generic.attack_damage,Base:38}]}
        execute as @e[type=ravager,nbt={Passengers:[{id:"minecraft:vindicator",HandItems:[{id:"minecraft:tnt",Count:1b},{}]}]}] run tag @s add TNT
        
        execute if entity @e[type=witch,nbt={RaidId:4,ActiveEffects:[{Id:10,Amplifier:0b}]}] at @s run effect give @s regeneration 30 1
        

        execute as @e[type=ravager,tag=!nightmare] run tag @s add nightmare

        execute as @e[type=vindicator,tag=!nightmare,limit=1,nbt={RaidId:2}] run block{
            execute as @s run summon vindicator ~ ~ ~
            execute as @s run tag @e[type=vindicator,distance=..1] add nightmare
            execute as @s run summon vindicator ~ ~ ~
            execute as @s run tag @e[type=vindicator,distance=..1] add nightmare
        }
    }
}
dir effects{
    function statuseffects{
        #slowfall
        statuseffect slowfalleffect slow_falling 0
        #jumpboost2
        statuseffect jumpboost2_effect jump_boost 1
        #speedboyboots
        statuseffect speedboyboots_effect speed 3
        #speedboyboots
        statuseffect haste2_effect haste 1
    }
    function setstatuseffects{
        #jump boost
        setstatuseffect jumpboost2 jumpboost2_effect
        #speed boy
        setstatuseffect speedboyboots speedboyboots_effect
        #haste helmet
        setstatuseffect hastehelmet haste2_effect
    }
}
dir customcrafts{
    function advancedglider{
        customcrafting advancedglider
    }
    function basicglider{
        customcrafting basicglider
    }
    function basicarrowwand{
        customcrafting basicarrowwand
    }
    function upgradedbasicarrowwand{
        customcrafting upgradedbasicarrowwand
    }
    function torchwand{
        customcrafting torchwand
    }
    function wandbook{
        customcrafting wandbook
    }
    function basicwand{
        customcrafting basicwand
    }
    #Floor craft wands
    clock 1s{
        floorwandcraft emeraldwand weaknesscore wandofweakening
        floorwandcraft wandofweakening upgradecore wandofweakening2
        floorwandcraft emeraldwand poisoncore wandofpoison
        floorwandcraft wandofpoison upgradecore wandofpoison2
        floorwandcraft emeraldwand basiccritcore handyemeraldwand

        floorwandcraftwithitem emeraldwand minecraft:lead wandofrope
        floorwandcraftwithitem emeraldwand minecraft:saddle riderwand
    }
    #All cores
    function weaknesscore{
        customcrafting weaknesscore
    }
    function poisoncore{
        customcrafting poisoncore
    }
    function basiccritcore{
        customcrafting basiccritcore
    }
}
dir giveitem{
    #potion 72450
    function wandbook{
        give @s written_book{pages:['["",{"text":"Nightmare wands","bold":true,"color":"red"},{"text":"\\n\\n\\n\\n","color":"reset"},{"text":"Wand combining:","bold":true},{"text":"\\nTo combine items throw them on top of an anvil.\\n\\n\\n\\n","color":"reset"},{"text":"Update this book","underlined":true,"color":"green","clickEvent":{"action":"run_command","value":"/function nightmare:wands/getwandbookupdate"}}]','["",{"text":"Basic Arrow Wand","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Basic Arrow Wand","color":"dark_aqua"},{"text":"\\n"},{"text":"Damage:","color":"dark_purple"},{"text":" 4","color":"yellow"},{"text":"\\n"},{"text":"Mana cost:","color":"dark_purple"},{"text":" 4","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown:","color":"dark_purple"},{"text":" 2s","color":"yellow"},{"text":"\\n"},{"text":"Use delay:","color":"dark_purple"},{"text":" 0.5s","color":"yellow"},{"text":"\\n"},{"text":"Ammo:","color":"dark_purple"},{"text":" arrow","color":"yellow"},{"text":"\\n"},{"text":"Range:","color":"dark_purple"},{"text":" Short","color":"yellow"},{"text":"\\n"},{"text":"50% chance to not consume ammo","italic":"true","color":"yellow"}]}},{"text":"\\n\\nCrafting recipe:\\n[ ][","color":"reset"},{"text":"A","hoverEvent":{"action":"show_item","contents":{"id":"arrow"}}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"][ ]"}]','["",{"text":"Upgraded Basic Arrow Wand","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Upgraded Basic Arrow Wand","color":"dark_aqua"},{"text":"\\n"},{"text":"Damage:","color":"dark_purple"},{"text":" 4","color":"yellow"},{"text":"\\n"},{"text":"Mana cost:","color":"dark_purple"},{"text":" 5","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown:","color":"dark_purple"},{"text":" 2s","color":"yellow"},{"text":"\\n"},{"text":"Use delay:","color":"dark_purple"},{"text":" 0.5s","color":"yellow"},{"text":"\\n"},{"text":"Ammo:","color":"dark_purple"},{"text":" arrow","color":"yellow"},{"text":"\\n"},{"text":"Range:","color":"dark_purple"},{"text":" Medium","color":"yellow"},{"text":"\\n"},{"text":"50% chance to not consume ammo","italic":"true","color":"yellow"}]}},{"text":"\\n\\nCrafting recipe:\\n[","color":"reset"},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]["},{"text":"A","hoverEvent":{"action":"show_item","contents":{"id":"arrow"}}},{"text":"]["},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]\\n["},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"]["},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]\\n["},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"]["},{"text":"G","hoverEvent":{"action":"show_item","contents":{"id":"gold_ingot"}}},{"text":"]"}]','["",{"text":"Arrow Wand","color":"aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Arrow Wand","color":"aqua"},{"text":"\\n"},{"text":"Damage:","color":"dark_purple"},{"text":" 6","color":"yellow"},{"text":"\\n"},{"text":"Mana cost:","color":"dark_purple"},{"text":" 5","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown:","color":"dark_purple"},{"text":" 3s","color":"yellow"},{"text":"\\n"},{"text":"Use delay:","color":"dark_purple"},{"text":" 0.5s","color":"yellow"},{"text":"\\n"},{"text":"Ammo:","color":"dark_purple"},{"text":" arrow","color":"yellow"},{"text":"\\n"},{"text":"Range:","color":"dark_purple"},{"text":" Medium","color":"yellow"},{"text":"\\n"},{"text":"25% chance to not consume ammo","italic":"true","color":"yellow"}]}},{"text":"\\n\\nnot obtainable yet","color":"reset"}]','["",{"text":"Upgraded Arrow Wand","color":"aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Upgraded Arrow Wand","color":"aqua"},{"text":"\\n"},{"text":"Damage:","color":"dark_purple"},{"text":" 6","color":"yellow"},{"text":"\\n"},{"text":"Mana cost:","color":"dark_purple"},{"text":" 5","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown:","color":"dark_purple"},{"text":" 3s","color":"yellow"},{"text":"\\n"},{"text":"Use delay:","color":"dark_purple"},{"text":" 0.5s","color":"yellow"},{"text":"\\n"},{"text":"Ammo:","color":"dark_purple"},{"text":" arrow","color":"yellow"},{"text":"\\n"},{"text":"Range:","color":"dark_purple"},{"text":" Medium","color":"yellow"},{"text":"\\n"},{"text":"Pierce:","color":"dark_purple"},{"text":" 2","color":"yellow"},{"text":"\\n"},{"text":"50% chance to not consume ammo","italic":"true","color":"yellow"}]}},{"text":"\\n\\nnot obtainable yet","color":"reset"}]','["",{"text":"Magic torch wand","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Magic torch wand","color":"dark_aqua"},{"text":"\\n"},{"text":"Mana Cost:","color":"dark_purple"},{"text":" 1","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown:","color":"dark_purple"},{"text":" 0.5s","color":"yellow"},{"text":"\\n"},{"text":"Description:","color":"dark_purple"},{"text":" Shoot torches from inventory","color":"yellow"}]}},{"text":"\\n\\nCrafting recipe:\\n[ ][","color":"reset"},{"text":"T","hoverEvent":{"action":"show_item","contents":{"id":"torch"}}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"stick"}}},{"text":"][ ]"}]','["",{"text":"Basic wand","color":"dark_green","hoverEvent":{"action":"show_text","value":["",{"text":"Emerald wand","color":"dark_green"},{"text":"\\n"},{"text":"Damage: ","color":"dark_purple"},{"text":"6","color":"yellow"},{"text":"\\n"},{"text":"Mana cost: ","color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"\\n"},{"text":"Mana regeneration cooldown: ","color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"\\n"},{"text":"Use delay: ","color":"dark_purple"},{"text":"1s","color":"yellow"},{"text":"\\n"},{"text":"Basic Wand","italic":"true","color":"yellow"}]}},{"text":"\\n\\n\\nCrafting recipe\\n[ ][","color":"reset"},{"text":"E","hoverEvent":{"action":"show_item","value":"{id:emerald,Count:1}"}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","value":"{id:stick,Count:1}"}},{"text":"][ ]\\n[ ]["},{"text":"S","hoverEvent":{"action":"show_item","value":"{id:stick,Count:1}"}},{"text":"][ ]"}]','["",{"text":"Weakness core","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Weakness core","color":"dark_aqua"},{"text":"\\n"},{"text":"Effects:","color":"dark_purple"},{"text":" Weakness & slowness","color":"yellow"},{"text":"\\n"},{"text":"Combine with basic wand","italic":"true","color":"yellow"}]}},{"text":"\\n\\n\\nCrafting recipe\\n[","color":"reset"},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"spider_eye"}}},{"text":"]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"spider_eye"}}},{"text":"]\\n["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"][ ]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]\\n["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"spider_eye"}}},{"text":"]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]["},{"text":"S","hoverEvent":{"action":"show_item","contents":{"id":"spider_eye"}}},{"text":"]"}]','["",{"text":"Poison core","color":"dark_aqua","hoverEvent":{"action":"show_text","contents":["",{"text":"Poison core","color":"dark_aqua"},{"text":"\\n"},{"text":"Effects:","color":"dark_purple"},{"text":" Wither","color":"yellow"},{"text":"\\n"},{"text":"Combine with basic wand","italic":"true","color":"yellow"}]}},{"text":"\\n\\n\\nCrafting recipe\\n[","color":"reset"},{"text":"E","hoverEvent":{"action":"show_item","contents":{"id":"emerald"}}},{"text":"]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]["},{"text":"E","hoverEvent":{"action":"show_item","contents":{"id":"emerald"}}},{"text":"]\\n["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"][ ]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]\\n["},{"text":"E","hoverEvent":{"action":"show_item","contents":{"id":"emerald"}}},{"text":"]["},{"text":"F","hoverEvent":{"action":"show_item","contents":{"id":"fermented_spider_eye"}}},{"text":"]["},{"text":"E","hoverEvent":{"action":"show_item","contents":{"id":"emerald"}}},{"text":"]"}]'],title:"Nightmare wands",author:""}
    }
    function advancedglider{
        give @s enchanted_book{advancedglider:1b,CustomModelData:652118,display:{Name:'[{"text":"Advanced Glider","italic":false,"color":"aqua"}]',Lore:['[{"text":"Charge: ","italic":false},{"text":"120","color":"yellow"},{"text":"","color":"dark_purple"}]']}} 1
    }
    function basicglider{
        give @s wooden_axe{basicglider:1b,CustomModelData:652118,display:{Name:'[{"text":"Basic Glider","italic":false}]',Lore:['[{"text":"Charge: ","italic":false},{"text":"30","color":"yellow"},{"text":"","color":"dark_purple"}]']}} 1
    }
    function basicarrowwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Basic Arrow Wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Short","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"50% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,basicarrowwand:1b} 1
    }
    function upgradedbasicarrowwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Upgraded Basic Arrow Wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Ammo: ","italic":false,"color":"dark_purple"},{"text":"arrow","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Range: ","italic":false,"color":"dark_purple"},{"text":"Medium","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"50% chance to not consume ammo","italic":true,"color":"yellow"}]']},wand:1b,upgradedbasicarrowwand:1b} 1
    }
    function torchwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Magic torch wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"1","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Shoot torches from inventory","color":"yellow"}]']},wand:1b,torchwand:1b} 1
    }
    function basicwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b} 1
    }
    function emeraldwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b} 1
    }
    function illagerwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Illager wand","italic":false,"color":"green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Effect: ","italic":false,"color":"dark_purple"},{"text":"Wither 2(0:4)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use time: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"MRC: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"named wand","italic":true,"color":"yellow"}]']},wand:1b,illagerwand:1b} 1
    }
    function illagerwand2{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Illager wand II","italic":false,"color":"green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Effect: ","italic":false,"color":"dark_purple"},{"text":"Wither 2(0:4)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Pierce","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use time: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"MRC: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"named wand","italic":true,"color":"yellow"}]']},wand:1b,illagerwand2:1b} 1
    }
    function tormentedwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Tormented wand","italic":false,"color":"green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Crit chance: ","italic":false,"color":"dark_purple"},{"text":"25%","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use time: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"MRC: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"named wand","italic":true,"color":"yellow"}]']},wand:1b,tormentedwand:1b} 1
    }
    function weakwizardhat{
        give @p leather_helmet{display:{color:8606770,Name:'[{"text":"Weak wizard hat","italic":false}]',Lore:['[{"text":"while wearing: ","italic":false},{"text":"Max mana increase by 5","color":"yellow"}]']},weakwizardhat:1b} 1
    }
    function lostwizardhat{
        give @p leather_helmet{display:{color:8606770,Name:'[{"text":"Lost wizard hat","italic":false}]',Lore:['[{"text":"while wearing: ","italic":false},{"text":"Max mana increase by 10","color":"yellow"}]']},lostwizardhat:1b} 1
    }
    #Floor craft wands
    function wandofweakening{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Wand of weakening","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Weakness (0:15) & Slowness (0:10)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Direct","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"2","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofweakening:1b} 1
    }
    function wandofweakening2{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Wand of weakening II","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Weakness (0:7) & Slowness (0:4)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Area","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofweakening2:1b} 1
    }
    function wandofpoison{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Wand of poison","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Wither (0:15)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Direct","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofpoison:1b} 1
    }
    function wandofpoison2{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Wand of poison II","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Wither (0:15)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Area","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofpoison2:1b} 1
    }
    function wandofrope{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Wand of rope","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"1","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Leash any entity. (uses lead from inventory)","color":"yellow"}]']},wand:1b,wandofrope:1b} 1
    }
    function riderwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Rider wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Ride entity","color":"yellow"}]']},wand:1b,riderwand:1b} 1
    }
    function handyemeraldwand{
        give @s warped_fungus_on_a_stick{CustomModelData:652119,display:{Name:'[{"text":"Handy emerald wand","italic":false,"color":"green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Crit chance: ","italic":false,"color":"dark_purple"},{"text":"5%","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use time: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"MRC: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"crafted wand","italic":true,"color":"yellow"}]']},wand:1b,handyemeraldwand:1b} 1
    }
    function ritualspotwand{
        give @s warped_fungus_on_a_stick{display:{Name:'[{"text":"Ritual Spot","italic":false,"color":"dark_red"}]',Lore:['[{"text":"Place this on the ground to make ritual spot","color":"yellow"}]']},ritualspotwand:1b} 1
    }
    #All cores
    function weaknesscore{
        give @s phantom_membrane{display:{Name:'[{"text":"Weakness core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Weakness & slowness","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},weaknesscore:1b} 1
    }
    function upgradecore{
        give @s phantom_membrane{display:{Name:'[{"text":"Upgrade core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Upgrades current effect","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with effect wand","italic":true,"color":"yellow"}]']},upgradecore:1b} 1
    }
    function poisoncore{
        give @s phantom_membrane{display:{Name:'[{"text":"Poison core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Wither","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},poisoncore:1b} 1
    }
    function basiccritcore{
        give @s phantom_membrane{display:{Name:'[{"text":"Basic crit core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Add 5% critical chance","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},basiccritcore:1b} 1
    }
}
dir summonitem{
    function wandofweakening{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Wand of weakening","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Weakness (0:15) & Slowness (0:10)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Direct","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"2","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofweakening:1b}}}
    }
    function wandofweakening2{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Wand of weakening II","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Weakness (0:7) & Slowness (0:4)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Area","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofweakening2:1b}}}
    }
    function wandofpoison{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Wand of poison","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Wither (0:15)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Direct","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"4","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofpoison:1b}}}
    }
    function wandofpoison2{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Wand of poison II","italic":false,"color":"aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Wither (0:15)","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Type: ","italic":false,"color":"dark_purple"},{"text":"Area","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay: ","italic":false,"color":"dark_purple"},{"text":"1s","color":"yellow"}]']},wand:1b,wandofpoison2:1b}}}
    }
    function wandofrope{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Wand of rope","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"1","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Leash any entity. (uses lead from inventory)","color":"yellow"}]']},wand:1b,wandofrope:1b}}}
    }
    function riderwand{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Rider wand","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Mana Cost: ","italic":false},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Description: ","italic":false,"color":"dark_purple"},{"text":"Ride entity","color":"yellow"}]']},wand:1b,riderwand:1b}}}
    }
    function emeraldwand{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b}}}
    }
    function basicwand{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Emerald wand","italic":false,"color":"dark_green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana regeneration cooldown: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use delay:","italic":false,"color":"dark_purple"},{"text":" 1s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Basic Wand","italic":true,"color":"yellow"}]']},wand:1b,emeraldwand:1b}}}
    }
    function handyemeraldwand{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:warped_fungus_on_a_stick",Count:1b,tag:{CustomModelData:652119,display:{Name:'[{"text":"Handy emerald wand","italic":false,"color":"green"}]',Lore:['[{"text":"Damage: ","italic":false},{"text":"6","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Crit chance: ","italic":false,"color":"dark_purple"},{"text":"5%","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Mana cost: ","italic":false,"color":"dark_purple"},{"text":"5","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Use time: ","italic":false,"color":"dark_purple"},{"text":"0.5s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"MRC: ","italic":false,"color":"dark_purple"},{"text":"2s","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"crafted wand","italic":true,"color":"yellow"}]']},wand:1b,handyemeraldwand:1b}}}
    }
    #core
    function weaknesscore{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Weakness core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Weakness & slowness","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},weaknesscore:1b}}}
    }
    function upgradecore{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Upgrade core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Upgrades current effect","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with effect wand","italic":true,"color":"yellow"}]']},upgradecore:1b}}}
    }
    function poisoncore{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Poison core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effects: ","italic":false},{"text":"Wither","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},poisoncore:1b}}}
    }
    function basiccritcore{
        execute as @s run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{display:{Name:'[{"text":"Basic crit core","italic":false,"color":"dark_aqua"}]',Lore:['[{"text":"Effect: ","italic":false},{"text":"Add 5% critical chance","color":"yellow"},{"text":"","color":"dark_purple"}]','[{"text":"Combine with basic wand","italic":true,"color":"yellow"}]']},basiccritcore:1b}}}
    }
}