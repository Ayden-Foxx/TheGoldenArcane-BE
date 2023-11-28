#> > > CORE OF ACCURSED < <
#> The function manages the effects of the Golden Curse on the Player, and allows functions to properly
#> interact with their targets. Functions rarely interact with each other on this module, so the CORE is
#> mostly a place for Players to interact with the functions' effects.


#> The CURSE
# When a Player is CURSED, they're affected with many random functions and effects.
# Here they are all played randomly, should the dices align, of course.

# ? CURSED Players have a faster Game Tick than uncursed ones. This might be a good or a bad thing...

scoreboard players add @a[tag=g_arrow:player.cursed] goldark.global.self_clock 2
scoreboard players add @a[tag=g_arrow:player.curse_lift] goldark.global.self_clock 1


# Every once in a while, one of the four major Curse Effects attempts to run.
# Successful or not, the score is reset again afterwards.

scoreboard players random @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=5000}] goldark.global.random_tick 1 100

execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.random_tick=1..25}] at @s run function g_arrow/curse/effects/dialogues
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.random_tick=26..50}] at @s run function g_arrow/curse/effects/effect
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.random_tick=51..80}] at @s run function g_arrow/curse/effects/gift
execute as @a[tag=g_arrow:player.cursed, scores={goldark.global.random_tick=81..100}] at @s run function g_arrow/curse/effects/music

scoreboard players set @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=5000..}] goldark.global.random_tick 0
scoreboard players set @a[tag=g_arrow:player.cursed, scores={goldark.global.self_clock=5000..}] goldark.global.self_clock 0


#> Additionally, if the Player has not created an Altar yet, holding a valid ingredient
#> shows its correct placement, as well as displaying a message in their actionbar.

execute as @a[tag=g_arrow:player.cursed, tag=!g_arrow:player.altar_learned] positioned ^ ^1 ^ align xyz run function g_arrow/curse/effects/point_altar

execute as @a[tag=g_arrow:altar.is_valid, tag=g_arrow:player.altar_learned] run tag @s remove g_arrow:player.altar_learned
execute as @a[tag=g_arrow:altar.is_valid] run titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.dialog.hint_altar.shoot"}]}