## LAMINA TENEBRIS - A swift and powerful attack to stun and injure victims.

# # INIT
execute if entity @s[scores={gdark.global.self_clock=200}] run tellraw @a[tag=g_arrow:in_battle] {"rawtext": [{"text": "§8[§l§7G. Arrow§r§8] §o§bLamina Tenebris!"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] run titleraw @a[tag=g_arrow:in_battle] actionbar {"rawtext": [{"translate": "gdark.g_arrow.battle.warn_atk.p_melee"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] as @a[r=12] at @s run playsound mob.wither.ambient @s ^ ^ ^1 1 0.5

execute if entity @s[scores={gdark.global.self_clock=200}] run effect @e[type=!player, r=12] slowness 3 4 ttue
