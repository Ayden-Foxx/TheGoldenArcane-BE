## If Golden Arrow is defeated...


execute as @a[tag=g_arrow:in_battle] at @s run particle minecraft:totem_particle ~ ~1 ~


loot give @a[tag=g_arrow:in_battle] loot "entities/golden_arrow_gear"


scoreboard players random @a[tag=g_arrow:in_battle] gdark.g_arrow.action_tick 1 100

execute as @a[tag=g_arrow:in_battle, scores={gdark.g_arrow.action_tick=1}] at @s unless entity @e[type=wolf, tag=g_arrow:luke] run function goldark/mobs/golden_arrow/battle/.spawn_luke

scoreboard players reset @a[tag=g_arrow:in_battle] gdark.g_arrow.action_tick


execute as @a[tag=g_arrow:in_battle] at @s run playsound mob.wither.death @s ^ ^ ^1 1 0.8 

tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.battle.on_end.succeed"}]}
