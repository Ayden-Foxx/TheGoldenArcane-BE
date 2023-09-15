## # CORE OF ACCURSED #
# # The function manages the effects of the Golden Curse on the Player, and allows functions to properly
# # interact with their targets. Functions rarely interact with each other on this module, so the CORE is
# # mostly a place for Players to interact with the functions' effects.


## The CURSE
# When a Player is CURSED, they're affected with many random functions and effects.
# Here they are all played randomly, should the dices align, of course.

# CURSED Players have a faster Game Tick than uncursed ones. This might be a good or bad thing...
scoreboard players add @a[tag=g_arrow:player.cursed] gdark.g_arrow.action_tick 2
scoreboard players add @a[tag=g_arrow:player.curse_lift] gdark.g_arrow.action_tick 1

# At specific intervals, three specific events might come at play: GIFTs, EFFECTs, or DIALOGUE, the latter being
# responsible for even more secondary unusual effects, such as illusions and monsters disappearing in plain sight.
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=2000}] at @s run function g_arrow/curse/effects/gift
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=2400}] at @s run function g_arrow/curse/effects/effect
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=3000}] at @s run function g_arrow/curse/effects/dialogues
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=4000}] at @s run function g_arrow/curse/effects/gift
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=4800}] at @s run function g_arrow/curse/effects/effect
execute as @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=6000}] at @s run function g_arrow/curse/effects/dialogues

# After the last effect, the tick is reset.
scoreboard players reset @a[tag=g_arrow:player.cursed, scores={gdark.g_arrow.action_tick=6000}] gdark.g_arrow.action_tick