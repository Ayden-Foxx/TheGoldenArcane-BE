## Rarely, strays are randomly replaced with a Golden Arrow Aparition. These "doppelgängers" are weaker than the
## original creature, and do not possess nearly as much abilities, but may still ambush unsuspecting players.

## Fortunately or not, only one may exist at a time, and never if the actual Golden Arrow is still present.
## When spawning, the game announces their presence in a similar way as it announces GA's summoning.


# A random number is chosen. Strays have a 1/5000 chance to become "Golden Arrow Apparitions".
scoreboard players random @s gdark.global.self_clock 1 5000

# Should the numbers align, a Doppelgänger is created.
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @e[tag=G_Arrow] unless entity @e[tag=G_Shadow] run tag @s add G_Shadow


# The Doppelgänger has 40 HP (20 Hearts), +8 HP (4 Hearts) of damage, and Speeed II
execute as @s[tag=G_Shadow] run effect @s health_boost 9999 9 true
execute as @s[tag=G_Shadow] run effect @s instant_damage 1 32 true
execute as @s[tag=G_Shadow] run effect @s strength 9999 1 true
execute as @s[tag=G_Shadow] run effect @s speed 9999 1 true

# It usually also inherits Golden Arrow's classic Golden armour, but not all pieces are guaranteed.
# If the original Stray possessed any Chestplate or Leggings prior to transformation, these are not replaced.
execute as @s[tag=G_Shadow] run replaceitem entity @e[type=stray, tag=G_Shadow] slot.armor.head 0 golden_helmet
execute if entity @s[tag=G_Shadow] run replaceitem entity @e[type=stray, tag=G_Shadow] slot.armor.chest 0 keep golden_chestplate
execute if entity @s[tag=G_Shadow] run replaceitem entity @e[type=stray, tag=G_Shadow] slot.armor.legs 0 keep golden_leggings
execute if entity @s[tag=G_Shadow] run replaceitem entity @e[type=stray, tag=G_Shadow] slot.armor.feet 0 golden_boots

# The creature is announced and nearby players are put in "Battle Mode" against it.
# Running away will cause them to be debuffed just like when fighting Golden Arrow,
# but other non-cursed may still attack it with no penalties.
# Golden Arrow also refuses to spawn while an Apparition is still alive.
execute if entity @s[tag=G_Shadow] run tag @a[r=24] add g_arrow:in_battle
execute if entity @s[tag=G_Shadow] run tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.summon.passive"}]}