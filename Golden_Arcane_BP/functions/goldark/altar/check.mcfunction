#> This function is run to detect a new Altar, or to check an existing one's validity.
#> The result is a tag added or removed to the Function caller indicating its integrity.
#> -------------------------------------------------------------------------------------


# Set 0 as a starting point. This number will increase for every valid tile found.
scoreboard players set @s goldark.g_altar.check 0

# And then, following Golden Arrow's recipe:

# * "[Cross of] Gold;" (+ / 4 tiles, below)
execute if block ~-1 ~-1 ~ gold_block run scoreboard players add @s goldark.g_altar.check 1
execute if block ~ ~-1 ~1 gold_block run scoreboard players add @s goldark.g_altar.check 1
execute if block ~1 ~-1 ~ gold_block run scoreboard players add @s goldark.g_altar.check 1
execute if block ~ ~-1 ~-1 gold_block run scoreboard players add @s goldark.g_altar.check 1

# * "[Core of] Glowstone;" (• / 1 tile, below)
execute if block ~ ~-1 ~ glowstone run scoreboard players add @s goldark.g_altar.check 1

# * "[Ring of] Redstone;" (O / 8 tiles, top)
execute if block ~-1 ~ ~ redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~-1 ~ ~1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~ ~ ~1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~1 ~ ~1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~1 ~ ~ redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~1 ~ ~-1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~ ~ ~-1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1
execute if block ~-1 ~ ~-1 redstone_wire run scoreboard players add @s goldark.g_altar.check 1

# * "And a Skull [above]." (• / 1 tile, top)
execute if block ~ ~ ~ skull run scoreboard players add @s goldark.g_altar.check 1


# ! All conditions must be met for the structure to be an Altar.

# The tag `altar.is_valid` is added to a valid Altar structure, and removed otherwise.
tag @s[tag=!goldark.altar.is_valid, scores={goldark.g_altar.check=14}] add goldark.altar.is_valid
tag @s[tag=goldark.altar.is_valid, scores={goldark.g_altar.check=..13}] remove goldark.altar.is_valid