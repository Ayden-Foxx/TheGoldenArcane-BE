# This function checks every arrow on the world, to test if they're on a valid altar

scoreboard players set @s[scores={gdark.g_arrow.altar_check=1..}] gdark.g_arrow.altar_check 0

# A skull in the center,
execute if block ~ ~ ~ skull run scoreboard players add @s gdark.g_arrow.altar_check 1
# A glowstone block below;
execute if block ~ ~-1 ~ glowstone run scoreboard players add @s gdark.g_arrow.altar_check 1

# A cross of golden blocks below,
execute if block ~-1 ~-1 ~ gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~-1 ~1 gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~-1 ~ gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~-1 ~-1 gold_block run scoreboard players add @s gdark.g_arrow.altar_check 1

# Wit a ring of redstone dust above.
execute if block ~-1 ~ ~ redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~-1 ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~ redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~1 ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~ ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1
execute if block ~-1 ~ ~-1 redstone_wire run scoreboard players add @s gdark.g_arrow.altar_check 1

# Should all of these be triggered, an altar is present. Therefore, the ritual shall begin
tag @s[tag=!ceremonial, scores={gdark.g_arrow.altar_check=14}] add ceremonial
tag @s[tag=ceremonial, scores={gdark.g_arrow.altar_check=..13}] remove ceremonial

execute as @s[tag=ceremonial] at @s run function goldark/mobs/golden_arrow/altar_active