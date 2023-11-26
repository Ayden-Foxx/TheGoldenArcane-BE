#> >> GOLDEN ARROW - THE FALLEN <<
#> This is the main function, where all code is put together to create
#> everything. Mainly used to connect Local COREs, but also runs some
#> miscellaneous code, where a sub-folder of its own would be a waste.


# * LOCAL CORE - ALTAR  ||  Manages ALL code related to Golden Arrow's Altar;
# ? Includes detection, activation, summoning, and more.
function g_arrow/altar/altar_core

# * LOCAL CORE - BATTLE  ||  Manages Golden Arrow's behavior when in-battle.
# ? Includes Special Skills, passive effects, penalties, et cetera.
function g_arrow/battle/battle_core

# * LOCAL CORE - CURSE  ||  Manages all interactions from the Golden Curse with the player.
# ? Includes dialogue, effects, misc. events, etc.
#soon(tm)
function g_arrow/battle/curse_core


# * MAIN - REPLACE STRAYS
# ? Occasionally replaces common Strays with Golden Arrow Apparitions, or Doppelgängers, weaker versions of the true Golden Arrow.
execute as @a[tag=g_arrow:player.cursed] at @s as @e[type=stray, r=24, rm=8] unless entity @e[type=gdark:golden_arrow] run function g_arrow/spawn_apparition