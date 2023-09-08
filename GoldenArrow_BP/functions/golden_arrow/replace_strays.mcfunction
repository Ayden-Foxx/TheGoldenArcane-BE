## Sometimes, strays are rarely replaced with a Golden Arrow. This only happens if no other GA currently exists in the world.


# A random number is chosen. Strays have a 1/5000 chance to become Golden Arrow.
scoreboard players random @s gdark.global.self_clock 1 5000

# Should the numbers align, a new GA exists.
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @e[tag=G_Arrow] run tag @s add G_Arrow
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @e[tag=G_Arrow] run summon goldark:ga_shadow "§6Arrow's Shadow"


# Effects
execute if entity @s[tag=G_Arrow] run effect @s health_boost 9999 9 true
execute if entity @s[tag=G_Arrow] run effect @s instant_damage 1 32 true
execute if entity @s[tag=G_Arrow] run effect @s strength 9999 0 true
execute if entity @s[tag=G_Arrow] run effect @s speed 9999 0 true

# Armor
execute if entity @s[tag=G_Arrow] run replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.head 0 golden_helmet
execute if entity @s[tag=G_Arrow] run replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.chest 0 golden_chestplate
execute if entity @s[tag=G_Arrow] run replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.legs 0 golden_leggings
execute if entity @s[tag=G_Arrow] run replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.feet 0 golden_boots

# Nearby players are considered "in battle" against G_Arrow. A unique message is also sent to warn all players of their presence.
execute if entity @s[tag=G_Arrow] run tag @a[r=24] add g_arrow:in_battle
execute if entity @s[tag=G_Arrow] run tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.summon.passive"}]}