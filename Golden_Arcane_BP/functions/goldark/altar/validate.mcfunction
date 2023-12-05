#> Validates a Ritual request, verifying the Altar's Souls and other Entities in-game.
#> If all conditions are validated, the Altar receives a new tag, and the Ritual proceeds.
#> ---------------------------------------------------------------------------------------


# If all conditions specified below are fulfilled, the request is validated, and the Ritual proceeds as usual.
# The tag `altar.run_ritual` allows an Altar to proceed with a received Ritual request.
execute if entity @s[scores={goldark.g_altar.souls=1..}] unless entity @e[family=ga_boss] unless entity @e[tag=goldark.doppelganger] run tag @s add goldark.altar.run_ritual


# * Otherwise, the lines below manage each individual error...

# ? No_Charges - The Altar requires a sacrifice first in order to accept this Ritual.
execute if entity @s[scores={goldark.g_altar.souls=..0}] run titleraw @p actionbar {"rawtext": [{"translate": "gdark.altar.reject.no_charge"}]}

# ? Summon_Alive - Another (or the same) Altar-summoned Entity is already in the world.
execute if entity @e[family=ga_boss] run titleraw @p actionbar {"rawtext": [{"translate": "gdark.altar.reject.summon_alive"}]}

# ? Doppelganger - A Doppelgänger is alive in the world. Defeat it to proceed with the Ritual.
execute if entity @e[tag=goldark.doppelganger] run titleraw @p actionbar {"rawtext": [{"translate": "gdark.altar.reject.doppelganger"}]}
