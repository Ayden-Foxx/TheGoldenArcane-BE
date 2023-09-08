## This will control which attacks are used, and when to use them.

# # ABILITY CLOCK & RANDOM ACT
scoreboard players add @s[tag=!g_arrow:lock_tick] gdark.global.self_clock 1
execute if score @s gdark.global.self_clock matches 1 run scoreboard players random @s[tag=!g_arrow:lock_tick] gdark.g_arrow.action_tick 1 50

# DASH to players whenever they're trying to escape Golden Arrow's melee range.
execute if entity @s[scores={gdark.global.self_clock=100..140, gdark.g_arrow.action_tick=1..25}] if entity @a[r=18, rm=2, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/melee/special

# Shoot a CHARGED SHOT on the nearest player, if Golden Arrow is in ranged mode.
execute if entity @s[scores={gdark.global.self_clock=200..300, gdark.g_arrow.action_tick=20..40}, tag=!g_arrow:dashing] if entity @a[r=20, rm=8, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/ranged/primary

# Calls for minions if player is too close for CHARGED SHOT.
execute if entity @s[scores={gdark.global.self_clock=200..210, gdark.g_arrow.action_tick=30..40}] if entity @a[r=24, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/melee/secondary

# When no attacks are avaliable, Golden Arrow HEALS themselves with 12 Hearts.
# As a SDV fan, "12 Hearts" always remind me of the wrong context... oh well.
execute if entity @s[scores={gdark.global.self_clock=300, gdark.g_arrow.action_tick=25..}] unless entity @a[r=2.5, m=!c] run function goldark/mobs/golden_arrow/battle/abilities/ranged/special


# # RESET CLOCK
scoreboard players reset @s[scores={gdark.global.self_clock=400}] gdark.global.self_clock