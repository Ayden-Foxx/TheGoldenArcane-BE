#> >> Like all CURSEs must do, an "Unending List of Weird DEBUFFs to Ail Ya".
#> While cursed, players may be randomly be inflicted with various effects.
#> These may be positive, negative, kinda neutral or just plain useless.
#> An effect is warned with a visual display on the affected user.

# ? Sometimes, nearby creatures and/or players are affected with very specific effects.

scoreboard players random @s goldark.global.random_tick 1 50


# * POSITIVE & NEUTRAL Effects (Buffs)
# Might have some positive impact to the Player. Curse-Lifted Players may occasionaly share these effects with each other.

execute if score @s goldark.global.random_tick matches 1 run effect @s speed 10 2 true
execute if score @s goldark.global.random_tick matches 24 run effect @a[tag=g_arrow:player.curse_lift] speed 10 2 true

execute if score @s goldark.global.random_tick matches 2 run effect @s haste 10 2 true
execute if score @s goldark.global.random_tick matches 25 run effect @a[tag=g_arrow:player.curse_lift] haste 10 2 true

execute if score @s goldark.global.random_tick matches 3 run effect @s strength 10 2 true
execute if score @s goldark.global.random_tick matches 26 run effect @a[tag=g_arrow:player.curse_lift] strength 10 2 true

execute if score @s goldark.global.random_tick matches 4 run effect @s jump_boost 10 2 true
execute if score @s goldark.global.random_tick matches 27 run effect @a[tag=g_arrow:player.curse_lift] jump_boost 10 2 true

execute if score @s goldark.global.random_tick matches 5 run effect @s regeneration 10 2 true
execute if score @s goldark.global.random_tick matches 28 run effect @a[tag=g_arrow:player.curse_lift] regeneration 10 2 true

execute if score @s goldark.global.random_tick matches 6 run effect @s resistance 10 2 true
execute if score @s goldark.global.random_tick matches 29 run effect @a[tag=g_arrow:player.curse_lift] resistance 10 2 true

execute if score @s goldark.global.random_tick matches 8 run effect @s fire_resistance 10 2 true
execute if score @s goldark.global.random_tick matches 30 run effect @a[tag=g_arrow:player.curse_lift] fire_resistance 10 2 true

execute if score @s goldark.global.random_tick matches 9 run effect @s water_breathing 10 2 true
execute if score @s goldark.global.random_tick matches 31 run effect @a[tag=g_arrow:player.curse_lift] water_breathing 10 2 true

execute if score @s goldark.global.random_tick matches 10 run effect @s invisibility 10 2 true
execute if score @s goldark.global.random_tick matches 32 run effect @a[tag=g_arrow:player.curse_lift] invisibility 10 2 true

execute if score @s goldark.global.random_tick matches 11 run effect @s night_vision 10 2 true
execute if score @s goldark.global.random_tick matches 33 run effect @a[tag=g_arrow:player.curse_lift] night_vision 10 2 true

execute if score @s goldark.global.random_tick matches 12 run effect @s health_boost 10 2 true
execute if score @s goldark.global.random_tick matches 34 run effect @a[tag=g_arrow:player.curse_lift] health_boost 10 2 true

execute if score @s goldark.global.random_tick matches 13 run effect @s absorption 10 2 true
execute if score @s goldark.global.random_tick matches 35 run effect @a[tag=g_arrow:player.curse_lift] absorption 10 2 true

execute if score @s goldark.global.random_tick matches 14 run effect @s saturation 100 4 true
execute if score @s goldark.global.random_tick matches 36 run effect @a[tag=g_arrow:player.curse_lift] saturation 100 4 true

execute if score @s goldark.global.random_tick matches 15 run effect @s slow_falling 10 2 true
execute if score @s goldark.global.random_tick matches 37 run effect @a[tag=g_arrow:player.curse_lift] slow_falling 10 2 true


# * NEGATIVE & DANGEROUS Effects (Debuffs)
# Causes negative results to the Player; none of these are lethal on their own, at least.
# Negative effects are never shared with other Players.

execute if score @s goldark.global.random_tick matches 16 run effect @s[tag=!g_arrow:player.curse_lift] slowness 10 1 true

execute if score @s goldark.global.random_tick matches 17 run effect @s[tag=!g_arrow:player.curse_lift] mining_fatigue 10 1 true

execute if score @s goldark.global.random_tick matches 18 run effect @s nausea 10 1 true

execute if score @s goldark.global.random_tick matches 19 run effect @s[tag=!g_arrow:player.curse_lift] blindness 10 1 true

execute if score @s goldark.global.random_tick matches 20 run effect @s[tag=!g_arrow:player.curse_lift] hunger 10 1 true

execute if score @s goldark.global.random_tick matches 21 run effect @s[tag=!g_arrow:player.curse_lift] weakness 10 1 true

execute if score @s goldark.global.random_tick matches 22 run effect @s[tag=!g_arrow:player.curse_lift] levitation 5 1 true

execute if score @s goldark.global.random_tick matches 23 run effect @s darkness 10 0 true


# * SPECIAL & SHARED Effects (Buffs & Debuffs)
# Rarely, instead of a player-unique effect, powerful darkness is cast upon all creatures nearby.
# These may actually be deadly to weaker creatures and/or foes.
execute if score @s goldark.global.random_tick matches 38 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] weakness 20 1 true
execute if score @s goldark.global.random_tick matches 38 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] slowness 3 2 true
execute if score @s goldark.global.random_tick matches 38 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] nausea 10 0 true
execute if score @s goldark.global.random_tick matches 38 run effect @e[r=10, family=!undead, type=!wolf] levitation 5 0 true

execute if score @s goldark.global.random_tick matches 39 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] mining_fatigue 20 1 true
execute if score @s goldark.global.random_tick matches 39 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] slowness 5 1 true
execute if score @s goldark.global.random_tick matches 39 run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] darkness 10 0 true
execute if score @s goldark.global.random_tick matches 39 run effect @e[r=10, family=!undead, type=!wolf] wither 10 0 true


execute if entity @s[scores={goldark.global.random_tick=38..39}] as @e[r=10, family=!inanimate, family=!undead, type=!wolf] at @s anchored eyes run particle minecraft:knockback_roar_particle
execute if entity @s[scores={goldark.global.random_tick=38..39}] run playsound ambient.cave @s ~ ~ ~ 0.8 0.8


# 40 or higher has no attributed effects, being a neutral zone where no harm nor good is done towards the player at all.


# * GLOBAL (To All Effects)
# Regardless of which effect is granted, a special particle is played to the cursed Player.
execute if entity @s[scores={goldark.global.random_tick=1..40}] run particle minecraft:totem_particle ~ ~1 ~

# The random_tick variable is also reset.
scoreboard players reset @s goldark.global.random_tick