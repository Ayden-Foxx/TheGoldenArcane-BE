## This function detects for specific blocks around a starting point (usually an Arrow) to detect a valid Golden Arrow Altar.
## The structure will be relevant for almost all of the addon's mechanics.


# Set 0 as a starting point. This number will increase for every valid tile found.
scoreboard players set @s[scores={gdark.g_arrow.altar_check=1..}] gdark.g_arrow.altar_check 0

# And then, following Golden Arrow's recipe:

# "[Cross of] Gold;" (+ / 4 tiles, below)
execute if block ~-1 ~-1 ~ gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~-1 ~1 gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~-1 ~ gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~-1 ~-1 gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1

# "[Core of] Glowstone;" (• / 1 tile, below)
execute if block ~ ~-1 ~ glowstone run scoreboard players add @s gdark.g_arrow.altar_check 1

# "[Ring of] Redstone;" (O / 8 tiles, top)
execute if block ~-1 ~ ~ redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~-1 ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~ redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~-1 ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1

# "And a Skull [above]." (• / 1 tile, top)
execute if block ~ ~ ~ skull run scoreboard players add @s gdark.g_arrow.altar_check 1


# When all checks are triggered, the game considers it a valid altar, and a tag is added to the reference entity.
# Otherwise, the game removes said tag to signal the altar is broken and longer valid.
tag @s[tag=!g_arrow:valid_altar, scores={gdark.g_arrow.altar_check=14}] add g_arrow:valid_altar
tag @s[tag=g_arrow:valid_altar, scores={gdark.g_arrow.altar_check=..13}] remove g_arrow:valid_altar