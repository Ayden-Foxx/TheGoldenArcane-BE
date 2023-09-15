## SEPULCHRUM ANIMA - Replaces "Nox Sagitta" when Golden Arrow is in melee mode.

execute if entity @s[scores={gdark.global.self_clock=200}] as @a[r=12] at @s run playsound mob.ghast.scream @s ^ ^ ^1 1 0.35

execute if entity @s[scores={gdark.global.self_clock=200}] run tellraw @a[tag=g_arrow:in_battle] {"rawtext": [{"text": "§8[§l§7. Arrow§r§8] §o§bSepulchrum Anima!"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] run titleraw @a[tag=g_arrow:in_battle] actionbar {"rawtext": [{"text": "gdark.g_arrow.battle.warn_spell.s_melee"}]}

execute if entity @s[scores={gdark.global.self_clock=200}] run tag @s add g_arrow:dashing
execute if entity @s[scores={gdark.global.self_clock=202}] run tag @s add g_arrow:lock_tick


execute if entity @s[scores={gdark.global.self_clock=202}] at @e[tag=g_arrow:gminion_summon, c=1] run tp @s ^ ^3 ^-3

effect @s[tag=g_arrow:dashing] invisibility 2 0 true
effect @s[tag=g_arrow:dashing] resistance 2 4 true
effect @s[tag=g_arrow:dashing] slowness 2 4 true
effect @s[tag=g_arrow:dashing] weakness 2 2 true

execute if entity @s[tag=g_arrow:dashing] run particle minecraft:basic_smoke_particle ~ ~1.2 ~


execute if entity @s[scores={gdark.global.self_clock=201}] run summon stray "GMinion Knight" ^-1 ^1 ^1
execute if entity @s[scores={gdark.global.self_clock=201}] run summon stray "GMinion Knight" ^1 ^1 ^1
execute if entity @s[scores={gdark.global.self_clock=201}] run summon stray "GMinion Archer" ^ ^1 ^1

execute if entity @s[scores={gdark.global.self_clock=201}] run tag @e[type=stray, name="GMinion Knight"] add g_arrow:gminion_summon
execute if entity @s[scores={gdark.global.self_clock=201}] run tag @e[type=stray, name="GMinion Archer"] add g_arrow:gminion_summon


execute if entity @s[scores={gdark.global.self_clock=201}] run replaceitem entity @e[tag=g_arrow:gminion_summon] slot.armor.head 0 golden_helmet

execute if entity @s[scores={gdark.global.self_clock=201}] run replaceitem entity @e[tag=g_arrow:gminion_summon, name="GMinion Knight"] slot.weapon.mainhand 0 golden_sword
execute if entity @s[scores={gdark.global.self_clock=201}] run replaceitem entity @e[tag=g_arrow:gminion_summon, name="GMinion Knight"] slot.weapon.offhand 0 golden_sword

execute if entity @s[scores={gdark.global.self_clock=201}] run replaceitem entity @e[tag=g_arrow:gminion_summon, name="GMinion Archer"] slot.weapon.mainhand 0 bow


execute if entity @e[tag=g_arrow:gminion_summon] as @a[tag=g_arrow:in_battle] run effect @s blindness 4 0 true

effect @e[tag=g_arrow:gminion_summon] speed 9 1 true
effect @e[tag=g_arrow:gminion_summon] resistance 9 1 true

effect @e[tag=g_arrow:gminion_summon, name="GMinion Knight"] strength 9 0 true


execute if entity @s[scores={gdark.global.self_clock=210}] unless entity @e[tag=g_arrow:gminion_summon] run tag @s remove g_arrow:dashing

execute if entity @s[scores={gdark.global.self_clock=210}] unless entity @e[tag=g_arrow:gminion_summon] run tag @s remove g_arrow:lock_tick


execute if entity @s[scores={gdark.global.self_clock=208..210}] unless entity @e[tag=g_arrow:gminion_summon] run particle minecraft:basic_flame_particle ^ ^1.7 ^0.8

execute if entity @s[scores={gdark.global.self_clock=210}] unless entity @e[tag=g_arrow:gminion_summon] run effect @s speed 1 2 true
execute if entity @s[scores={gdark.global.self_clock=210}] unless entity @e[tag=g_arrow:gminion_summon] run effect @s jump_boost 1 3 true