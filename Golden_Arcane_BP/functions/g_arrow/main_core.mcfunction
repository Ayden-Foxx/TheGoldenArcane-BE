#> >> > * GOLDEN ARROW - THE FALLEN * < <<
#> This is Golden Arrow's CORE Function, where all sub-Modules
#> are put together to create the actual Golden Warrior entity.
#> Disabling this file essentially removes G. Arrow from the game.
#> ---------------------------------------------------------------


# * LOCAL CORE - ALTAR  ||  Manages ALL code related to Golden Arrow's Altar;
# ? Includes detection, activation, summoning, and more.

function g_arrow/altar/arrows_core


# * LOCAL CORE - BATTLE  ||  Manages Golden Arrow's behavior when in-battle.
# ? Includes Special Skills, passive effects, penalties, et cetera.
# ! The BATTLE Module is paused until a Golden Arrow instance is detected in the world.

#// execute as @e[type=goldark:golden_arrow] if entity @a[r=24] run function g_arrow/battle/battle_core


# * LOCAL CORE - CURSE  ||  Manages all interactions from the Golden Curse with the Player.
# ? Includes dialogue, effects, misc. events, etc.
# ! The CURSE Module is always paused whenever a Golden Arrow instance is in a world.

execute as @a[scores={goldark.curse_level.g_arrow=1..}] unless entity @e[type=goldark:golden_arrow] run function g_arrow/curse/curse_core