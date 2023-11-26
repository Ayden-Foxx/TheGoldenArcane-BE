#> When an ALTAR is properly triggered, a summoning ritual begins.
#> At the end of the clock, Golden Arrow is summoned above the ALTAR's skull.


# * Starts the Timer. At full completion, Golden Arrow is summoned.
scoreboard players add @s gdark.global.self_clock 1


# * AT FIRST TICK:
# Begin the particles, starting with one at the arrow's position.
execute as @e[type=arrow, tag=g_arrow:altar.is_valid] at @s run particle minecraft:basic_smoke_particle

# Also begin the ritual with a horn sound
execute as @a[tag=g_arrow:player.cursed] at @s run playsound raid.horn @a ^ ^1 ^2 2 0.5

# Inflict nearby players with Nausea
execute if score @s gdark.g_arrow.self_clock matches 1 run effect @a[r=16] nausea 10 0 true


# * AT 100 TICKS: (5 secs total)
# The ritual truly begins. All players are warned; The message depends on the player's distance to the Altar.
execute if score @s gdark.global.self_clock matches 100 run titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.warn_near"}]}

execute if score @s gdark.global.self_clock matches 100 run tellraw @a[rm=16] {"rawtext": [{"text": "§8§l[...] §r"}, {"translate": "gdark.g_arrow.summon.warn_far"}]}

# The depths of the Underworld start to seep into this realm...
execute if score @s gdark.global.self_clock matches 100 run playsound portal.portal @a[r=16] ~ ~ ~ 1 0.5

# Players are inflicted with Darkness, and the dummy entity receives Levitation.
execute if score @s gdark.global.self_clock matches 100 run effect @a[r=16] darkness 5 0 true
execute if score @s gdark.global.self_clock matches 100 run effect @s levitation 4 1 true

# A camera shake is also triggered to nearby players
execute if score @s gdark.global.self_clock matches 100 run camerashake add @a[r=16] 0.08 4 positional


# * FROM 100 TICKS ONWARDS:
# Rotate the dummy on its own position.
execute if score @s gdark.global.self_clock >= 100 run tp @s ~ ~ ~ ~8

# Create particles around it. These will also rotate with the dummy itself.
execute if score @s gdark.global.self_clock >= 100 run particle minecraft:blue_flame_particle ^1 ^ ^1
execute if score @s gdark.global.self_clock >= 100 run particle minecraft:blue_flame_particle ^-1 ^ ^1

# Also create particles on the skull's position
execute if score @s gdark.global.self_clock >= 100 at @e[type=goldark:altar_spot, c=1] run particle minecraft:critical_hit_emitter


# * AT 160 TICKS & ONWARDS: (3 secs later)
# A second flame begins playing above the altar before the last countdown ends.
execute if score @s gdark.global.self_clock >= 160 run particle minecraft:basic_flame_particle ^ ^ ^0.25

execute if score @s gdark.global.self_clock matches 160 run playsound mob.evocation_fangs.attack @a[r=16] 1.5 0.5


# * UP TO 200 TICKS: (~10 secs total)
# All things stop. The Golden Warrior rises from beyond.
execute if score @s gdark.global.self_clock matches 190 run stopsound @a

execute if score @s gdark.global.self_clock matches 195 run playsound mob.enderdragon.growl @a ~ ~1 ~ 2.5 0.5

execute if score @s gdark.global.self_clock matches 200 run function g_arrow/summon_g_arrow

# Finally, the ritual is over, and the dummy entity is removed.
execute if score @s gdark.global.self_clock matches 200 run kill @s