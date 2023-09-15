execute if entity @s[scores={gdark.global.self_clock=200}] run tag @s add g_arrow:lock_weapon

execute if entity @s[scores={gdark.global.self_clock=200}] as @a[r=12] at @s run playsound mob.blaze.breathe @s ^ ^ ^1 1 0.5

execute if entity @s[scores={gdark.global.self_clock=200}] run tellraw @a[tag=g_arrow:in_battle] {"rawtext": [{"text": "§8[§l§7G. Arrow§r§8] §o§bNox Sagitta!"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] run titleraw @a[tag=g_arrow:in_battle] actionbar {"rawtext": [{"translate": "gdark.g_arrow.battle.warn_atk.p_ranged"}]}