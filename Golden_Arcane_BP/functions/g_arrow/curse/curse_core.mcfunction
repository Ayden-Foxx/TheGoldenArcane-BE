#> > > CORE OF ACCURSED < <
#> The function manages the effects of the Golden Curse on the Player, and allows functions to properly
#> interact with their targets. Functions rarely interact with each other on this module, so the CORE is
#> mostly a place for Players to interact with the functions' effects.


#> The CURSE
# When a Player is CURSED, they're affected with many random functions and effects.
# Here they are all played randomly, should the dices align, of course.

# * CURSED Players have a faster Game Tick than uncursed ones. This might be a good or bad thing...

scoreboard players add @a[tag=g_arrow:player.cursed] goldark.global.self_clock 2
scoreboard players add @a[tag=g_arrow:player.curse_lift] goldark.global.self_clock 1


# Every 1000 ticks, one of the three Curse effects attempt to run. Successful or not, the score is reset again afterwards.

scoreboard players random @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000}] goldark.global.random_tick 1 12

execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000, goldark.global.random_tick=1}] at @s run function g_arrow/curse/effects/dialogues
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000, goldark.global.random_tick=2}] at @s run function g_arrow/curse/effects/effect
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000, goldark.global.random_tick=3}] at @s run function g_arrow/curse/effects/gift
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000, goldark.global.random_tick=4}] at @s run function g_arrow/curse/effects/music

scoreboard players reset @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=1000}] goldark.global.self_clock