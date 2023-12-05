#> This function will summon Golden Arrow, or teleport it, if one already exists in-game
# (Despite being likely impossible, the code for teleporting a GA is still kept from older updates)


# (From previous verions) Teleports an already existing Golden Arrow, if it is found.
tp @e[type=goldark:golden_arrow] ~ ~ ~

# [If no existing instance is found...] A new Golden Arrow is summoned.
execute unless entity @e[type=goldark:golden_arrow] run summon goldark:golden_arrow

# They briefly levitate and are immune to all damage while doing so.
effect @e[type=goldark:golden_arrow] levitation 3 0 true
effect @e[type=goldark:golden_arrow] resistance 3 4 true

# Golden Arrow usually already spawns with enchanted armory, but just in case they don't,
# a common set of Golden armour is provided instead.
replaceitem entity @e[type=goldark:golden_arrow] slot.armor.head 0 keep golden_helmet
replaceitem entity @e[type=goldark:golden_arrow] slot.armor.chest 0 keep golden_chestplate
replaceitem entity @e[type=goldark:golden_arrow] slot.armor.legs 0 keep golden_leggings
replaceitem entity @e[type=goldark:golden_arrow] slot.armor.feet 0 keep golden_boots


#> Multiple visual effects and sounds are played when Golden Arrow is summoned...
#* "...And the world falls apart for a brief moment, as the legendary hero rises from beyond..."

# Big Kaboom Particle Effect (TM)
particle minecraft:huge_explosion_emitter

# Nearby creatures receive damage based on distance, up to two blocks away from the Altar's central spot.
damage @e[family=!inanimate, r=1] 12 entity_explosion entity @e[type=goldark:golden_arrow, c=1]
damage @e[family=!inanimate, rm=1, r=2] 8 entity_explosion entity @e[type=goldark:golden_arrow, c=1]
damage @e[family=!inanimate, rm=2, r=3] 4 entity_explosion entity @e[type=goldark:golden_arrow, c=1]

# Creatures near up to three blocks are inflicted Wither III for 3 seconds.
effect @e[family=!inanimate, r=4] wither 3 2 false

# A sound is played to all nearby players, signaling they're now on battle with G. Arrow...
execute as @a at @s run playsound mob.wither.ambient @s ^ ^ ^1 1 0.4
camerashake add @a[r=16] 0.25 2 rotational

# The tag `player.in_battle` is added to all Players near G. Arrow's summoning.
# The tag prevents them from escaping the battle, and Golden Arrow despawns once all Players with this tag are defeated.
tag @a[scores={goldark.curse_level.g_arrow=1..}, r=16] add g_arrow.player.in_battle

# The Chat is warned of Golden Arrow's summoning, no matter their distance to the Altar itself.
tellraw @a {"rawtext": [{"translate": "gdark.on_summon.announce"}]}