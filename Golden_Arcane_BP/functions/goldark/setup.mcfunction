#> Creates game variables, aka Scoreboards' Dummy Objectives.
# ! This function MUST be run before all others, otherwise the pack will not work properly!


# ? GLOBAL Variables
scoreboard objectives add goldark.global.local_difficulty dummy
scoreboard objectives add goldark.global.random_tick dummy
scoreboard objectives add goldark.global.self_clock dummy


# * Traits & Tales
scoreboard objectives add goldark.paths.inner_clock dummy

# * Golden Arrow - The Fallen
scoreboard objectives add goldark.g_arrow.altar_check dummy
scoreboard objectives add goldark.g_arrow.altar_souls dummy


# Once all is set up, the Player is notified with a nice first message :)
playsound random.levelup @a ~ ~ ~ 1 1.25
particle minecraft:totem_particle ~ ~1 ~

tellraw @a {"rawtext": [{"translate": "gdark.world.initialize_a"}]}
tellraw @a {"rawtext": [{"translate": "gdark.world.initialize_b"}]}