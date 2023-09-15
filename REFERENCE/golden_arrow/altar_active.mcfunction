## This function will run once an arrow has been found in a valid altar.


# First and foremost, a countdown begins. The ritual takes 5 seconds to summon/tp a G_Arrow
scoreboard players add @s[tag=ceremonial] gdark.g_arrow.altar_delay 1
scoreboard players remove @s[tag=!ceremonial] gdark.g_arrow.altar_delay 1


# When a ritual begins, all players are warned of the summoning in progress.
# The message itself depends on how far the player is to the active altar
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=60}] run titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.warn_nearby"}]}
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=60}] run tellraw @a[rm=16] {"rawtext": [{"translate": "gdark.g_arrow.summon.warn_far"}]}

# If the altar is broken mid-spell, the power recedes, and Golden Arrow is not summoned.
execute if entity @s[tag=!ceremonial, scores={gdark.g_arrow.altar_delay=1..}] run titleraw @a[r=18] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.failed"}]}
execute if entity @s[tag=!ceremonial, scores={gdark.g_arrow.altar_delay=1..}] run tellraw @a[rm=18] {"rawtext": [{"text": "§8[...] "}, {"translate": "gdark.g_arrow.summon.failed"}]}


# Close players are also inflicted with visual effects while the ritual is happening
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=45}] as @a[r=16] at @s run playsound mob.wither.spawn @s ^ ^ ^1 1 0.5
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=30}] run effect @a[r=18] darkness 8 0 true
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=45}] run camerashake add @a[r=16] 0.08 3.3 positional

execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=25}] run tag @a[r=12] add altar_trigger

# Along with the countdown, a special Armor Stand is also summoned.
# It does nothing by itself, but is used as a reference to generate all the special effects from the ritual itself
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=60}] run summon armor_stand galtar_summon ~ ~-3 ~

effect @e[type=armor_stand, name=galtar_summon] invisibility 7 0 true
effect @e[type=armor_stand, name=galtar_summon] resistance 7 4 true
execute as @e[type=armor_stand, name=galtar_summon] at @s run tp @s ~ ~ ~ ~8

# Special Effects by GALTAR_SUMMON (le Stand)
execute if entity @s[scores={gdark.g_arrow.altar_delay=25..}] run particle minecraft:basic_smoke_particle

execute as @e[type=armor_stand, name=galtar_summon] at @s run particle minecraft:blue_flame_particle ^ ^3.1 ^1
execute as @e[type=armor_stand, name=galtar_summon] at @s run particle minecraft:blue_flame_particle ^ ^3.1 ^-1

execute as @e[type=armor_stand, name=galtar_summon] at @s run particle minecraft:enchanting_table ~ ~4 ~


## After 5 seconds, the ritual is done, and the summoned creature appears.

# Particles are played to indicate the final event (skull, arrow, focus point)
execute positioned as @e[type=armor_stand, name=galtar_summon] if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=159..160}] run particle minecraft:knockback_roar_particle ~ ~2.8 ~
execute positioned as @e[type=armor_stand, name=galtar_summon] if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=140..160}] run particle minecraft:basic_flame_particle ~ ~4 ~

# The blocks in the center of the altar are consumed by the power of the summon
# A lightning also strikes the center point
execute positioned as @e[type=armor_stand, name=galtar_summon] if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run setblock ~ ~2 ~ soul_soil
execute positioned as @e[type=armor_stand, name=galtar_summon] if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run setblock ~ ~3 ~ air
execute positioned as @e[type=armor_stand, name=galtar_summon] if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run summon lightning_bolt ~ ~3 ~


# The actual entity, the true Golden Arrow himself, is summoned at the focus point
# Note that if G_Arrow already exists, it will be instead teleported to the altar
execute as @e[type=armor_stand, name=galtar_summon] at @s positioned ~ ~2 ~ if entity @e[type=arrow, tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run function goldark/mobs/golden_arrow/spawn_ga


## Once the spell is done, both Arrow and Armor Stand are consumed, and the player is rid of extra tags
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run tag @a[r=24] remove altar_trigger
execute if entity @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}] run kill @e[type=armor_stand, name=galtar_summon]
kill @s[tag=ceremonial, scores={gdark.g_arrow.altar_delay=160}]