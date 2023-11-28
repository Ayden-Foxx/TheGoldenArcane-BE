#> >> GOLDEN ARROW - THE FALLEN <<
#> This is the main function, where all code is put together to create
#> everything. Mainly used to connect Local COREs, but also runs some
#> miscellaneous code, where a sub-folder of its own would be a waste.


# * LOCAL CORE - ALTAR  ||  Manages ALL code related to Golden Arrow's Altar;
# ? Includes detection, activation, summoning, and more.

function g_arrow/altar/altar_core


# * LOCAL CORE - BATTLE  ||  Manages Golden Arrow's behavior when in-battle.
# ? Includes Special Skills, passive effects, penalties, et cetera.

# ! The BATTLE Module is paused until a Golden Arrow instance is detected in the world.

# Soon(tm), currently under major overhaul!
# execute if entity @e[type=goldark:golden_arrow] run function g_arrow/battle/battle_core


# * LOCAL CORE - CURSE  ||  Manages all interactions from the Golden Curse with the player.
# ? Includes dialogue, effects, misc. events, etc.

# ! The CURSE Module is always paused whenever a Golden Arrow instance is in a world.

execute unless entity @e[type=goldark:golden_arrow] run function g_arrow/curse/curse_core


# * MAIN - REPLACE STRAYS || Occasionally summons GA Doppelgängers around Cursed players.
# ? Doppelgängers may replace Strays with a very low chance every tick,
# ? unless another Doppelgänger or GA themselves are present in the world.

execute as @a[tag=g_arrow:player.cursed, tag=!g_arrow:player.curse_lift] at @s as @e[type=stray, r=24, rm=8] unless entity @e[type=goldark:golden_arrow] run function g_arrow/spawn_apparition