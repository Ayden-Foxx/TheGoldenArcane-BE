#> Rarely, strays are randomly replaced with a Golden Arrow Aparition. These "doppelgängers" are weaker than the
#> original creature, and do not possess nearly as much abilities, but may still ambush unsuspecting players.

# * Fortunately or not, only one may exist at a time, and never if the actual Golden Arrow is still present.
# * When spawning, the game announces their presence in a similar way as it announces GA's summoning.


# A random number is chosen. Strays have a 1/5000 chance to become "Golden Arrow Apparitions".
scoreboard players random @s goldark.global.self_clock 1 5000

# Should the numbers align, a Doppelgänger is created.
execute if entity @s[scores={goldark.global.self_clock=1}] unless entity @e[tag=g_arrow:arrow.doppelganger] run tag @s add g_arrow:arrow.doppelganger


# The Doppelgänger has 40 HP (20 Hearts), +8 HP (4 Hearts) of damage, and Speeed II
execute as @s[tag=g_arrow:arrow.doppelganger] run effect @s health_boost 9999 9 true
execute as @s[tag=g_arrow:arrow.doppelganger] run effect @s instant_damage 1 32 true
execute as @s[tag=g_arrow:arrow.doppelganger] run effect @s strength 9999 1 true
execute as @s[tag=g_arrow:arrow.doppelganger] run effect @s speed 9999 1 true

# It usually also inherits Golden Arrow's classic Golden armour, but not all pieces are guaranteed.
# If the original Stray possessed any Chestplate or Leggings prior to transformation, these are not replaced.
execute as @s[tag=g_arrow:arrow.doppelganger] run replaceitem entity @e[type=stray, tag=g_arrow:arrow.doppelganger] slot.armor.head 0 golden_helmet
execute if entity @s[tag=g_arrow:arrow.doppelganger] run replaceitem entity @e[type=stray, tag=g_arrow:arrow.doppelganger] slot.armor.chest 0 keep golden_chestplate
execute if entity @s[tag=g_arrow:arrow.doppelganger] run replaceitem entity @e[type=stray, tag=g_arrow:arrow.doppelganger] slot.armor.legs 0 keep golden_leggings
execute if entity @s[tag=g_arrow:arrow.doppelganger] run replaceitem entity @e[type=stray, tag=g_arrow:arrow.doppelganger] slot.armor.feet 0 golden_boots

# The creature is announced and nearby players are put in "Battle Mode" against it.
# Running away will cause them to be debuffed just like when fighting Golden Arrow,
# but other non-cursed may still attack it with no penalties.
# Golden Arrow also refuses to spawn while an Apparition is still alive.
execute if entity @s[tag=g_arrow:arrow.doppelganger] run tag @a[r=16] add g_arrow:player.in_battle
execute if entity @s[tag=g_arrow:arrow.doppelganger] run tellraw @a[r=24] {"rawtext": [{"translate": "gdark.g_arrow.summon.passive"}]}