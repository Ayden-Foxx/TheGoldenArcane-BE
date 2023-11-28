#> When an ALTAR is triggered, it is first checked wether it has charges or not.
#> If it does, one is taken and the Ritual proceeds. Otherwise, a warning is displayed.


# ? If the ALTAR has no Souls energy

execute unless entity @s[scores={goldark.g_arrow.altar_souls=1..}] as @e[type=arrow, tag=g_arrow:altar.is_valid, r=1, c=1] at @s run particle minecraft:endrod

execute unless entity @s[scores={goldark.g_arrow.altar_souls=1..}] as @e[type=arrow, tag=g_arrow:altar.is_valid, r=1, c=1] at @s run playsound random.fizz @a[r=8] ~ ~ ~ 0.5 1.5

execute unless entity @s[scores={goldark.g_arrow.altar_souls=1..}] as @e[type=arrow, tag=g_arrow:altar.is_valid, r=1, c=1] run titleraw @p actionbar {"rawtext": [{"translate": "gdark.g_arrow.altar.no_charge"}]}

execute unless entity @s[scores={goldark.g_arrow.altar_souls=1..}] as @e[type=arrow, tag=g_arrow:altar.is_valid, r=1, c=1] run kill @s


# ? Otherwise...

execute if entity @s[scores={goldark.g_arrow.altar_souls=1..}] run scoreboard players remove @s goldark.g_arrow.altar_souls 1
execute if entity @s[scores={goldark.g_arrow.altar_souls=1..}] run summon goldark:altar_trigger