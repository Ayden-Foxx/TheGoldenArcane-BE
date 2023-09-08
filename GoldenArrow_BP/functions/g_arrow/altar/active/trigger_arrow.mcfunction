## When a summon request is validated, a special dummy entity is created to progress Golden Arrow's summoning.
# As long as the dummy is alive, the code will keep running. Removing the arrow kills the entity, preventing the ritual.


# # Start the Timer. When the ritual reaches full completion, Golden Arrow is summoned.
scoreboard players add @s gdark.global.self_clock 1


# # AT FIRST TICK:
# Begin the particles, starting with one at the arrow's position.
execute as @e[type=arrow, tag=g_arrow:valid_altar] at @s run particle minecraft:basic_smoke_particle

# Inflict players with Nausea
execute if score @s gdark.g_arrow.self_clock matches 1 run effect @a[r=18] nausea 5 0 true


# # AT 100 TICKS: (5 secs total)
# The ritual truly begins. All players are warned; The message depends on the player's distance to the Altar.
execute if score @s gdark.global.self_clock matches 100 run titleraw @a[r=24] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.begin_near"]}

execute if score @s gdark.global.self_clock matches 100 run tellraw @a[rm=24] {"rawtext": [{"text": "§8§l[...] §r"}, {"translate": "gdark.g_arrow.summon.begin_afar"]}

# Players are inflicted with Darkness, and the dummy entity receives Levitation.
execute if score @s gdark.global.self_clock matches 100 run effect @a[r=20] darkness 8 0 true
execute if score @s gdark.global.self_clock matches 100 run effect @s levitation 7 0 true


# FROM 100 TICKS ONWARDS:
# Rotate the dummy on its own position.
execute if score @s gdark.global.self_clock >= 100 run tp @s ~ ~ ~ ~8

# Create particles around it. These will also rotate with the dummy itself.
execute if score @s gdark.global.self_clock >= 100 run particle minecraft:blue_flame_particle ^1 ^ ^1
execute if score @s gdark.global.self_clock >= 100 run particle minecraft:blue_flame_particle ^-1 ^ ^1

# Also create particles on the skull's position (or as close as possible)
execute if score @s gdark.global.self_clock >= 100 at @e[type=arrow, tag=g_arrow:valid_altar] positioned ~ ~-1 ~ run particle minecraft:critical_hit_emitter


# # AT 240 TICKS: (7 secs later)
# A second flame begins playing above the altar before the last countdown ends.
execute if score @s gdark.global.self_clock >= 180 run particle minecraft:basic_flame_particle ^ ^ ^0.25
