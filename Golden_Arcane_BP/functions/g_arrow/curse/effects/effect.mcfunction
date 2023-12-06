# * Like all CURSEs must do, an "Unending List of Weird DEBUFFs to Ail Ya".

#> While cursed, players may be randomly be inflicted with various effects.
#> These may be positive, negative, kinda neutral or just plain useless.
#> An effect is warned with a visual display on the affected user.
#> ------------------------------------------------------------------------

# ? Sometimes, nearby creatures and/or players are affected with very specific effects.

scoreboard players random @s goldark.random_tick 1 40


# * POSITIVE & NEUTRAL Effects (Buffs)
# Might have some positive impact to the Player.

effect @s[scores={goldark.random_tick=1}] speed 10 2 true

effect @s[scores={goldark.random_tick=2}] haste 10 2 true

effect @s[scores={goldark.random_tick=3}] strength 10 2 true

effect @s[scores={goldark.random_tick=4}] jump_boost 10 2 true

effect @s[scores={goldark.random_tick=5}] regeneration 10 2 true

effect @s[scores={goldark.random_tick=6}] resistance 10 2 true

effect @s[scores={goldark.random_tick=7}] fire_resistance 10 2 true

effect @s[scores={goldark.random_tick=8}] water_breathing 10 2 true

effect @s[scores={goldark.random_tick=9}] invisibility 10 2 true

effect @s[scores={goldark.random_tick=10}] night_vision 10 2 true

effect @s[scores={goldark.random_tick=11}] health_boost 10 2 true

effect @s[scores={goldark.random_tick=12}] absorption 10 2 true

effect @s[scores={goldark.random_tick=13}] saturation 100 4 true

effect @s[scores={goldark.random_tick=14}] slow_falling 10 2 true


# * NEGATIVE & DANGEROUS Effects (Debuffs)
# Causes negative results to the Player; none of these are actually lethal on their own.

effect @s[scores={goldark.random_tick=15, goldark.curse_level.g_arrow=..2}] slowness 10 1 true

effect @s[scores={goldark.random_tick=16, goldark.curse_level.g_arrow=..2}] mining_fatigue 10 1 true

effect @s[scores={goldark.random_tick=17}] nausea 10 0 true

effect @s[scores={goldark.random_tick=18, goldark.curse_level.g_arrow=..2}] blindness 10 1 true

effect @s[scores={goldark.random_tick=19, goldark.curse_level.g_arrow=..2}] hunger 10 1 true

effect @s[scores={goldark.random_tick=20, goldark.curse_level.g_arrow=..2}] weakness 10 1 true

effect @s[scores={goldark.random_tick=21, goldark.curse_level.g_arrow=..2}] levitation 5 1 true

effect @s[scores={goldark.random_tick=22}] darkness 10 0 true


# * SPECIAL & SHARED Effects (Buffs & Debuffs)
# Rarely, instead of a player-unique effect, powerful darkness is cast upon all creatures nearby.
# These may actually be deadly to weaker creatures and/or foes.
execute if entity @s[scores={goldark.random_tick=23}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] weakness 20 1 true
execute if entity @s[scores={goldark.random_tick=24}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] slowness 3 2 true
execute if entity @s[scores={goldark.random_tick=25}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] nausea 10 0 true
execute if entity @s[scores={goldark.random_tick=26}] run effect @e[r=10, family=!undead, type=!wolf] levitation 5 0 true
execute if entity @s[scores={goldark.random_tick=27}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] mining_fatigue 20 1 true
execute if entity @s[scores={goldark.random_tick=28}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] slowness 5 1 true
execute if entity @s[scores={goldark.random_tick=29}] run effect @e[r=10, family=!inanimate, family=!undead, type=!wolf] darkness 10 0 true
execute if entity @s[scores={goldark.random_tick=30}] run effect @e[r=10, family=!undead, type=!wolf] wither 10 0 true


execute if entity @s[scores={goldark.random_tick=23..30}] as @e[r=10, family=!inanimate, family=!undead, type=!wolf] at @s run particle minecraft:knockback_roar_particle ~ ~1 ~
playsound ambient.cave @s[scores={goldark.random_tick=23..30}] ~ ~ ~ 1.2 0.8


# 30 or higher has no attributed effects, being a neutral zone where no harm nor good is done towards the player at all.


# * GLOBAL (To All Effects)
# Regardless of which effect is granted, a special particle is played to the cursed Player.
execute if entity @s[scores={goldark.random_tick=1..30}] run particle minecraft:totem_particle ~ ~1 ~

# The random_tick variable is also reset.
scoreboard players reset @s goldark.random_tick