### ## GOLDEN ARROW #
# The core which gives life to GOLDEN ARROW, a powerful menace who inhabits the coldest lands of the world.


## # ARROWS (Mundane)

# Checks for arrows, and then tests the terrain around it to detect a valid altar
execute as @e[type=arrow] at @s run function goldark/mobs/golden_arrow/altar_check

# If an arrow is collected before the ritual is done, the spell also fails.
execute as @a[tag=altar_trigger, c=1] at @s unless entity @e[type=arrow, tag=ceremonial] run titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.failed"}]}
execute as @a[tag=altar_trigger, c=1] at @s unless entity @e[type=arrow, tag=ceremonial] run tellraw @a[rm=16] {"rawtext": [{"text": "ยง8[...] "}, {"translate": "gdark.g_arrow.summon.failed"}]}

execute as @a[tag=altar_trigger] at @s unless entity @e[type=arrow, tag=ceremonial] run kill @e[type=armor_stand, name=galtar_summon]
execute as @a[tag=altar_trigger] at @s unless entity @e[type=arrow, tag=ceremonial] run tag @s remove altar_trigger


## # GOLDEN ARROW

## Passive Abilities & Attacks
execute as @e[type=stray, tag=G_Arrow] at @s run function goldark/mobs/golden_arrow/battle/abilities/passive_abilities

## Special Abilities & Attacks
execute as @e[tag=G_Arrow] at @s run function goldark/mobs/golden_arrow/battle/abilities/local_core


# # Teleport GA's Shadow to Golden Arrow
execute as @e[tag=G_Arrow] at @s run tp @e[type=goldark:ga_shadow] ~ ~8 ~

# # Replace Strays with Golden Arrow (1/5000)
execute unless entity @e[tag=G_Arrow] as @a at @s as @e[type=stray, r=48, rm=7] run function goldark/mobs/golden_arrow/replace_strays


# # On DEFEAT
execute if entity @a[tag=g_arrow:in_battle] unless entity @e[tag=G_Arrow] run function goldark/mobs/golden_arrow/battle/on_self_defeat

execute if entity @e[type=stray, tag=G_Arrow] unless entity @e[type=player, tag=g_arrow:in_battle] run function goldark/mobs/golden_arrow/battle/on_plrs_defeat

execute as @a[tag=g_arrow:in_battle] unless entity @e[tag=G_Arrow] run tag @s remove g_arrow:in_battle

# # On IDLE
execute as @e[type=stray, tag=G_Arrow] at @s unless entity @a[r=48] run scoreboard players add @s gdark.global.despawn_tick 1
execute as @e[type=stray, tag=G_Arrow] if score @s gdark.global.despawn_tick matches 1200 run function goldark/mobs/golden_arrow/battle/on_plrs_defeat

# # IF AFAR
execute as @e[type=stray, tag=G_Arrow] at @s as @a[tag=g_arrow:in_battle, rm=32] at @s run function goldark/mobs/golden_arrow/battle/too_far


# # Destroy GShadow if no Golden Arrow
execute as @e[type=goldark:ga_shadow] unless entity @e[type=stray, tag=G_Arrow] run kill @s