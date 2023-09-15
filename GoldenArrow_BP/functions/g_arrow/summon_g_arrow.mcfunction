## This function will summon Golden Arrow, or teleport it, if one already exists in-game
# (Despite being likely impossible, the code for teleporting a GA is still kept from older updates)


# (From previous verions) Teleports an already existing Golden Arrow, if it is found.
tp @e[type=gdark:golden_arrow] ~ ~ ~

# [If no existing instance is found...] A new Golden Arrow is summoned.
execute unless entity @e[type=gdark:golden_arrow] run summon gdark:golden_arrow

# They briefly levitate and are immune to all damage while doing so.
effect @e[type=gdark:golden_arrow] levitation 3 0 true
effect @e[type=gdark:golden_arrow] resistance 3 4 true

# Golden Arrow usually already spawns with enchanted armory, but just in case they don't,
# a common set of Golden armour is provided instead.
replaceitem entity @e[type=gdark:golden_arrow] slot.armor.head 0 keep golden_helmet
replaceitem entity @e[type=gdark:golden_arrow] slot.armor.chest 0 keep golden_chestplate
replaceitem entity @e[type=gdark:golden_arrow] slot.armor.legs 0 keep golden_leggings
replaceitem entity @e[type=gdark:golden_arrow] slot.armor.feet 0 keep golden_boots


## Multiple visual effects and sounds are played when Golden Arrow is summoned...
## "...And the world falls apart for a brief moment, as the legendary hero rises from beyond..."

# Big Kaboom Particle Effect (TM)
particle minecraft:huge_explosion_emitter

# Nearby creatures receive damage based on distance, up to two blocks away from the Altar's central spot.
damage @e[family=!inanimate, r=1] 10 entity_explosion entity @e[type=gdark:golden_arrow]
damage @e[family=!inanimate, rm=1, r=2] 8 entity_explosion entity @e[type=gdark:golden_arrow]
damage @e[family=!inanimate, rm=2, r=3] 4 entity_explosion entity @e[type=gdark:golden_arrow]

# Creatures near up to three blocks are inflicted Wither III for 3 seconds.
effect @e[family=!inanimate, r=4] wither 3 2 false

# A sound is played to all nearby players, signaling they're now on battle with G. Arrow...
execute as @a[r=24] at @s run playsound mob.wither.ambient @s ^ ^ ^1 1 0.4
camerashake add @a[r=24] 0.25 2 rotational

# A tag is added to all Players up to 24 blocks away. While tagged, they cannot escape,
# and G. Arrow despawns once all players with this tag are defeated.
tag @a[r=24] add g_arrow:player.in_battle

# The Chat is warned of Golden Arrow's summoning, no matter their distance to the Altar itself.
tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.summon.successful"}]}