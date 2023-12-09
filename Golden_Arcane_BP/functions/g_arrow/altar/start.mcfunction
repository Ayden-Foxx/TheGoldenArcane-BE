#> This function triggers Golden Arrow's summoning Ritual on a target Altar after a brief delay.
#> If the Altar has no Souls, neither the delay nor the Ritual will run.
#> ---------------------------------------------------------------------------------------------


# A delay begins for 5 seconds before the Ritual.
scoreboard players add @s[scores={goldark.g_altar.souls=1.., goldark.delay.primary=..99}] goldark.delay.primary 1

# Within this timeframe, the Player may remove the Arrow,
# preventing the Ritual with no extra warning displayed.

# After the delay, if the Arrow is still present, the Ritual begins.
execute if entity @s[scores={goldark.delay.primary=100}] run function g_arrow/altar/ritual