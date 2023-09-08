## This function will summon Golden Arrow, or teleport it, if one already exists in-game

tp @e[tag=G_Arrow] ~ ~ ~

execute unless entity @e[tag=G_Arrow] run summon stray "§lGolden Arrow"
execute unless entity @e[tag=G_Arrow] run summon goldark:ga_shadow "§6Arrow's Shadow" ~ ~10 ~

# A tag is added to GA to always identify it
# They're also buffed to be stronger than the regular Stray enemy
tag @e[type=stray, name="§lGolden Arrow", tag=!G_Arrow] add G_Arrow

effect @e[type=stray, tag=G_Arrow] health_boost 9999 9 true
effect @e[type=stray, tag=G_Arrow] instant_damage 1 32 true
effect @e[type=stray, tag=G_Arrow] strength 9999 0 true
effect @e[type=stray, tag=G_Arrow] speed 9999 0 true

effect @e[type=stray, tag=G_Arrow] levitation 3 0 true
effect @e[type=stray, tag=G_Arrow] fire_resistance 99 0 true


# A loot table is loaded to give GA their armor and weapons. If nothing is given, a default golden armor is granted instead.
# ...

replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.head 0 golden_helmet
replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.chest 0 golden_chestplate
replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.legs 0 golden_leggings
replaceitem entity @e[type=stray, tag=G_Arrow] slot.armor.feet 0 golden_boots


# "The world falls apart for a brief moment as the legendary hero rises from beyond"
particle minecraft:huge_explosion_emitter
damage @e[family=!inanimate, r=1] 10 entity_explosion entity @e[tag=G_Arrow]
damage @e[family=!inanimate, rm=1, r=2] 8 entity_explosion entity @e[tag=G_Arrow]
damage @e[family=!inanimate, rm=2, r=3] 4 entity_explosion entity @e[tag=G_Arrow]
effect @e[family=!inanimate, r=4] wither 3 2 false

execute as @a[r=12] at @s run playsound mob.wither.ambient @s ^ ^ ^1 1 0.4
camerashake add @a[r=14] 0.25 2 rotational

tag @a[r=24] add g_arrow:in_battle

tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.summon.successful"}]}