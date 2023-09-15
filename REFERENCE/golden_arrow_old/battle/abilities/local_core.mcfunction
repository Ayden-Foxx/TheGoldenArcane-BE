## This will control which attacks are used, and when to use them.

# # ABILITY CLOCK & RANDOM ACT
scoreboard players add @s[tag=!g_arrow:lock_tick] gdark.global.self_clock 1
execute if score @s gdark.global.self_clock matches 1 run scoreboard players random @s[tag=!g_arrow:lock_tick] gdark.g_arrow.action_tick 1 50


## # MELEE
## Primary Ability: LAMINA TENEBRIS
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/melee/primary

## Secondary Ability: SEPULCRUM ANIMA
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/melee/secondary

## Special Skill: DASH
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/melee/special


## # RANGED
## Primary Ability: NOX SAGITTA
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/ranged/primary

## Secondary Ability: UMBRA PLUERE
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/ranged/secondary

## Special Skill: HEAL
execute if score @s gdark.g_arrow.action_tick matches 1 run function goldark/mobs/golden_arrow/battle/abilities/ranged/special


# DASH to players whenever they're trying to escape Golden Arrow's melee range.
execute if entity @s[scores={gdark.global.self_clock=100..140, gdark.g_arrow.action_tick=1..25}] if entity @a[r=18, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/dash_to_player

# Shoot a CHARGED SHOT on the nearest player, if Golden Arrow is in ranged mode.
execute if entity @s[scores={gdark.global.self_clock=200..250, gdark.g_arrow.action_tick=20..40}] if entity @a[r=20, rm=8, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/charged_shot

# Calls for minions if player is too close for CHARGED SHOT.
execute if entity @s[scores={gdark.global.self_clock=200..240, gdark.g_arrow.action_tick=25..40}] if entity @a[r=8, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/call_minions

# When no attacks are avaliable, Golden Arrow HEALS themselves with 12 Hearts.
# As a SDV fan, "12 Hearts" always remind me of the wrong context... oh well.



# # RESET CLOCK
scoreboard players reset @s[scores={gdark.global.self_clock=400}] gdark.global.self_clock