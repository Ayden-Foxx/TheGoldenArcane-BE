#> Transforms random Undead monsters into "Fallen Apparitions", doppelgängers of
#> Golden Warriors with similar, albeit limited abilities. These may only exist
#> when no other Warrior is alive in a world, unless directly summoned by them.
#> ---------------------------------------------------------------------------------

# ? When naturally spawned, the Apparition chooses randomly which of the three Golden Warriors it will mimick.


# A random number is chosen. Undead mobs have a 1/10000 chance to become a "Fallen Apparition".
# This is also one of the few use cases where `self_clock` is used as a random value.
scoreboard players random @s goldark.self_clock 1 10000

# Should the numbers align, another dice is thrown.
scoreboard players random @s[scores={goldark.self_clock=1}] goldark.random_tick 1 3

# * The resulting number defines which Golden Warrior the Doppelgänger mimicks:

# ? The Doppelgänger mimicks Golden Arrow and their abilities.
execute if entity @s[scores={goldark.random_tick=1}] unless entity @e[tag=g_arrow.doppelganger] run tag @s add g_arrow.doppelganger
# ? The Doppelgänger mimicks Golden Knight and their abilities.
execute if entity @s[scores={goldark.random_tick=2}] unless entity @e[tag=g_knight.doppelganger] run tag @s add g_knight.doppelganger
# ? The Doppelgänger mimicks Golden Trinity and their abilities.
execute if entity @s[scores={goldark.random_tick=3}] unless entity @e[tag=g_trinity.doppelganger] run tag @s add g_trinity.doppelganger

# On either of these, a tag is added to mark it as a `doppelganger`.
execute if entity @s[scores={goldark.random_tick=1}] unless entity @e[tag=goldark.doppelganger] run tag @s add goldark.doppelganger

# The Entity's score is also reset at the end of evaluation.
scoreboard players reset @s goldark.self_clock
scoreboard players reset @s goldark.random_tick


# * If the Undead was actually chosen to be an Apparition/Doppelgänger:


# The Doppelgänger has 40 HP (20 Hearts), +8 damage, and Speeed II
execute as @s[tag=goldark.doppelganger] run effect @s health_boost 9999 9 true
execute as @s[tag=goldark.doppelganger] run effect @s instant_damage 1 32 true
execute as @s[tag=goldark.doppelganger] run effect @s strength 9999 1 true
execute as @s[tag=goldark.doppelganger] run effect @s speed 9999 1 true

# It usually also inherits the Golden Warriors' classic Golden armour, but not all pieces are guaranteed.
# If the original Entity possessed any Chestplate or Leggings prior to transformation, these are not replaced.
execute as @s[tag=goldark.doppelganger] run replaceitem entity @e[tag=goldark.doppelganger] slot.armor.head 0 golden_helmet
execute if entity @s[tag=goldark.doppelganger] run replaceitem entity @e[tag=goldark.doppelganger] slot.armor.chest 0 keep golden_chestplate
execute if entity @s[tag=goldark.doppelganger] run replaceitem entity @e[tag=goldark.doppelganger] slot.armor.legs 0 keep golden_leggings
execute if entity @s[tag=goldark.doppelganger] run replaceitem entity @e[tag=goldark.doppelganger] slot.armor.feet 0 golden_boots


# The new Apparition is announced in chat to all Players.
# The nearest Player's tag is broadcasted as a reference for its location.
execute if entity @s[tag=goldark.doppelganger] run tellraw @a[r=16] {"rawtext": [{"translate": "gdark.on_spawm.doppelganger.near"}]}
execute if entity @s[tag=goldark.doppelganger] run tellraw @a[rm=16] {"rawtext": [{"translate": "gdark.on_spawn.doppelganger.afar", "with": [ @p ]}]}