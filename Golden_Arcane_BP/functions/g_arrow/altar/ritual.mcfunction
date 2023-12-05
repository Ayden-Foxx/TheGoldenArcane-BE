#> Summons GOLDEN ARROW at the end of a countdown.
#> (Has many flashy stuff during G.A.'s summoning)
#> -----------------------------------------------


# * Starts the Timer. At full completion, Golden Arrow is summoned.
scoreboard players add @s goldark.self_clock 1


# * AT FIRST TICK:
# Begin the particles, starting with one at the Arrow's position.
execute as @e[type=arrow, tag=goldark.altar.is_valid] at @s run particle minecraft:basic_smoke_particle

# Also plays the Raid goat horn sound, at a lower pitch, to all nearby Players.
# Cursed Players will hear the horn regardless of their distance to the Altar.
execute if score @s goldark.self_clock matches 1 run playsound raid.horn @a[r=24] ^ ^1 ^2 2 0.5
execute if score @s goldark.self_clock matches 1 as @a[scores={goldark.curse_level.g_arrow=1..}, rm=24] at @s run playsound raid.horn @a ^ ^1 ^2 1 0.5


# * AT 100 TICKS: (5 secs total)
# The ritual truly begins. All players are warned; The message depends on the player's distance to the Altar.
execute if score @s goldark.self_clock matches 100 run titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.altar.ritual.start.near"}]}
execute if score @s goldark.self_clock matches 100 run tellraw @a[rm=16] {"rawtext": [{"translate": "gdark.altar.ritual.start.afar"}]}

# A certain familiar summoning sound can be heard here...
execute if score @s goldark.self_clock matches 100 run playsound wither.spawn @a[r=16] ~ ~ ~ 1 0.5

# Players are inflicted with Darkness, and the Trigger Entity receives Levitation.
execute if score @s goldark.self_clock matches 100 run effect @a[r=16] darkness 5 0 true
execute if entity @s[scores={goldark.self_clock=100..}] run effect @s levitation 5 1 true

# A camera shake is also triggered to nearby players
execute if score @s goldark.self_clock matches 100 run camerashake add @a[r=16] 0.1 4 positional


# * FROM 100 TICKS ONWARDS:
# Rotate the Entity on its own position.
execute if entity @s[scores={goldark.self_clock=100..}] run tp @s ~ ~ ~ ~8

# Create particles around it.
execute if entity @s[scores={goldark.self_clock=100..}] run particle minecraft:blue_flame_particle ^1 ^ ^1
execute if entity @s[scores={goldark.self_clock=100..}] run particle minecraft:blue_flame_particle ^-1 ^ ^1

# Also create particles on the skull's position
execute if entity @s[scores={goldark.self_clock=100..}] at @e[type=goldark:altar_spot, c=1] run particle minecraft:mob_portal
execute if entity @s[scores={goldark.self_clock=100..}] at @e[type=goldark:altar_spot, c=1] run particle minecraft:lava_particle


# * AT 160 TICKS & ONWARDS: (3 secs later)
# A second flame begins playing above the altar before the last countdown ends.
execute if entity @s[scores={goldark.self_clock=160..}] run particle minecraft:basic_flame_particle ^ ^ ^0.25

execute if score @s goldark.self_clock matches 160 run playsound mob.evocation_fangs.attack @a[r=16] ~ ~ ~ 2 0.5


# * UP TO 200 TICKS: (10 secs total)
# All things stop. The Golden Warrior rises from beyond.
execute if score @s goldark.self_clock matches 180 run stopsound @a

execute if score @s goldark.self_clock matches 195 run playsound mob.enderdragon.growl @a[r=16] ~ ~1 ~ 1 0.5

execute if score @s goldark.self_clock matches 195 as @a[scores={goldark.curse_level.g_arrow=1..}, rm=16] at @s run playsound mob.enderdragon.growl @s ^ ^1 ^2 0.8 0.4

execute if score @s goldark.self_clock matches 200 run function g_arrow/altar/summon

# Finally, the ritual is over, and the dummy entity is removed.
execute if score @s goldark.self_clock matches 200 run kill @s