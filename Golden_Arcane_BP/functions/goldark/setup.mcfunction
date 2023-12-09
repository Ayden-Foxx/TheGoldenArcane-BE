#> > >> * SETUP GOLDARK'S WORLD * << <
#> This functions sets up Golden Arcane's game variables, aka /scoreboard's Dummy Objectives.
#> Variables are defined by their dependant packs, their use and exclusivity in their task.
#> ------------------------------------------------------------------------------------------

# ! This function MUST be run before all others, otherwise the pack will not work properly!


# * GLOBAL/Generic Variables
# Used to define bosses' abilities and overall strength.
scoreboard objectives add goldark.ga_difficulty dummy
# Used by various randomness-based Functions.
scoreboard objectives add goldark.random_tick dummy
# Used by various time-based Functions.
scoreboard objectives add goldark.self_clock dummy


# * Delays for BATTLE Modules
# Used for one-time Function Effects (most notoriously in BATTLE Modules).
scoreboard objectives add goldark.delay.primary dummy
scoreboard objectives add goldark.delay.secondary dummy
scoreboard objectives add goldark.delay.tertiary dummy
scoreboard objectives add goldark.delay.quaternary dummy

# * Data for ALTAR Modules
# Used to verify an Altar's validity and integrity.
scoreboard objectives add goldark.g_altar.check dummy
# Used by Altars to count Soul Energy/Charges from sucessful sacrifices.
scoreboard objectives add goldark.g_altar.souls dummy

# * Levels for CURSE Modules
# Used to keep track of which Curses the Player possess.
scoreboard objectives add goldark.curse_level.any dummy
scoreboard objectives add goldark.curse_level.g_arrow dummy
scoreboard objectives add goldark.curse_level.g_knight dummy
scoreboard objectives add goldark.curse_level.g_trinity dummy


# * Loop score for SOUL Paths (Traits & Tales - Soon!)
scoreboard objectives add goldark.paths.inner_clock dummy


# Once all is set up, the Player is notified with a nice first message :)
execute as @a at @s run playsound random.levelup @s ^ ^ ^ 1 1.25
particle minecraft:totem_particle ~ ~1 ~

tellraw @a {"rawtext": [{"translate": "gdark.world.initialize.a"}]}
tellraw @a {"rawtext": [{"translate": "gdark.world.initialize.b"}]}
tellraw @a {"rawtext": [{"translate": "gdark.world.initialize.c"}]}