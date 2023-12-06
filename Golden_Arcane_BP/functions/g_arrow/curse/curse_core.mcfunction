#> >> > CORE OF ACCURSED < <<
#> The function manages the effects of the Golden Curse on the Player, and allows functions to properly
#> interact with their targets. Functions rarely interact with each other on this module, so the CORE is
#> mostly a place for Players to interact with the functions' effects.
#> -----------------------------------------------------------------------------------------------------


#> The CURSE
# When a Player is CURSED, they're affected with many random functions and effects.
# Here they are all played randomly, should the dices align, of course.

# ? CURSED Players have a faster Game Tick than uncursed ones. This might be a good or a bad thing...

scoreboard players add @s[scores={goldark.curse_level.g_arrow=1}] goldark.self_clock 2
scoreboard players add @s[scores={goldark.curse_level.g_arrow=2..}] goldark.self_clock 1


# Every once in a while, one of the four major Curse Effects attempts to run.
# Successful or not, the score is reset again afterwards.

scoreboard players random @s[scores={goldark.curse_level.g_arrow=1.., goldark.self_clock=5000}] goldark.random_tick 1 100

execute if entity @s[scores={goldark.random_tick=1..25}] run function g_arrow/curse/effects/dialogues
execute if entity @s[scores={goldark.random_tick=26..50}] run function g_arrow/curse/effects/effect
execute if entity @s[scores={goldark.random_tick=51..80}] run function g_arrow/curse/effects/gift
execute if entity @s[scores={goldark.random_tick=81..100}] run function g_arrow/curse/effects/music

scoreboard players set @s[scores={goldark.self_clock=5000..}] goldark.random_tick 0
scoreboard players set @s[scores={goldark.self_clock=5000..}] goldark.self_clock 0