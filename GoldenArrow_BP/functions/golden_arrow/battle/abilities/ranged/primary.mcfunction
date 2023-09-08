## NOX SAGITTA - A powerful rare attack, channeling dark energies to heavily injure its victim.

execute if entity @s[scores={gdark.global.self_clock=200}] run tag @s add g_arrow:lock_weapon
execute if entity @s[scores={gdark.global.self_clock=300}] run tag @s remove g_arrow:lock_weapon

execute if entity @s[scores={gdark.global.self_clock=200}] as @a[r=12] at @s run playsound mob.blaze.breathe @s ^ ^ ^1 1 0.5
execute if entity @s[scores={gdark.global.self_clock=200}] run  effect @a[r=12] darkness 5 0 true

execute if entity @s[scores={gdark.global.self_clock=200}] run tellraw @a[tag=g_arrow:in_battle] {"rawtext": [{"text": "§8[§l§7G. Arrow§r§8] §o§bNox Sagitta!"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] run titleraw @a[tag=g_arrow:in_battle] actionbar {"rawtext": [{"translate": "gdark.g_arrow.battle.warn_atk.p_ranged"}]}

execute if entity @s[scores={gdark.global.self_clock=200..300}] run particle minecraft:critical_hit_particle ~ ~2 ~


execute unless entity @e[tag=g_arrow:charged_doom] run tag @e[type=arrow, r=2, c=1] add g_arrow:charged_doom
execute as @e[tag=g_arrow:charged_doom, tag=g_arrow:doom_spear] run tag @s remove g_arrow:doom_spear


execute as @e[tag=g_arrow:charged_doom] at @s run particle minecraft:basic_flame_particle
execute as @e[tag=g_arrow:charged_doom] at @s run particle minecraft:endrod ^ ^ ^

scoreboard players add @e[tag=g_arrow:charged_doom] gdark.global.self_clock 1


execute as @e[tag=g_arrow:charged_doom] at @s run effect @a[r=2.4] fatal_poison 10 1 false
execute as @e[tag=g_arrow:charged_doom] at @s run effect @a[r=2.4] slowness 8 2 true

execute as @e[tag=g_arrow:charged_doom, tag=!g_arrow:evoked] at @s if entity @a[r=2.3] run summon lightning_bolt ^ ^1 ^0.5
execute as @e[tag=g_arrow:charged_doom, tag=!g_arrow:evoked] at @s if entity @a[r=2.3] run tag @s add g_arrow:evoked

execute as @e[tag=g_arrow:charged_doom] at @s at @a[r=2.4] run particle minecraft:totem_manual

execute as @e[tag=g_arrow:charged_doom] at @s at @a[r=2.4] run kill @s

execute as @e[tag=g_arrow:charged_doom, scores={gdark.global.self_clock=100}] run particle minecraft:large_explosion
execute as @e[tag=g_arrow:charged_doom, scores={gdark.global.self_clock=100}] run summon lightning_bolt
execute as @e[tag=g_arrow:charged_doom, scores={gdark.global.self_clock=100}] run kill @s