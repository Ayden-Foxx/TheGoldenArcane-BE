#> > > CORE OF ALTAR < <
# * This function manages all functions related to Golden Arrow's Altar, and handles their interactions with each other and other files.
# * Each code block is a different function, referenced here to interact with other files.


#> Curse Management
# To interact with an Altar, the player must first possess the Golden Curse.
# The curse marks arrows with its own tag, which allows it to interact with other files.

execute as @a[tag=g_arrow:player.cursed] at @s run tag @e[type=arrow, r=3] add g_arrow:player.curse_touch

# Arrows lose this tag when too far away from a Cursed player, though.
execute as @e[tag=g_arrow:player.curse_touch] at @s unless entity @a[tag=g_arrow:player.cursed, r=8] run playsound random.fizz @a[r=12] ~ ~ ~ 0.8 0.8
execute as @e[tag=g_arrow:player.curse_touch] at @s unless entity @a[tag=g_arrow:player.cursed, r=8] run particle minecraft:knockback_roar_particle
execute as @e[tag=g_arrow:player.curse_touch] at @s unless entity @a[tag=g_arrow:player.cursed, r=8] run tag @s remove g_arrow:player.curse_touch


#> Check Altar
# Cursed Arrows will search their surrounding terrain for a valid Golden Arrow Altar.
# Detecting one marks the object as valid for future interactions.

execute as @e[tag=g_arrow:player.curse_touch] at @s if block ~ ~ ~ skull run function g_arrow/altar/check_altar

# When a Player builds an Altar for the first time, it is also checked here.
# (The tag is removed if they aren't in position anymore.)
execute as @a[tag=g_arrow:player.cursed, tag=!g_arrow:player.altar_learned] at @s facing entity @s feet if block ~ ~ ~2 skull run function g_arrow/altar/check_altar

execute as @a[tag=g_arrow:altar.is_valid] at @s facing entity @s feet unless block ~ ~ ~2 skull run tag @s remove g_arrow:altar.is_valid


# * From there:


#> Activate Altar
# An Arrow on a valid, yet inactive Altar activates it, allowing the Player to properly interact with the structure.

execute as @e[type=arrow, tag=g_arrow:altar.is_valid] at @s unless entity @e[type=goldark:altar_spot, r=2] run function g_arrow/altar/activate

#> Trigger Altar
# When a "valid arrow" is found, the next code block handles the Altar's triggering.
# Should all conditions match, a new Golden Arrow is summoned from it.

execute as @e[type=goldark:altar_spot] at @s if entity @e[type=arrow, tag=g_arrow:altar.is_valid, r=1] unless entity @e[type=goldark:golden_arrow] unless entity @e[type=goldark:altar_trigger] run function g_arrow/altar/check_trigger

execute as @e[type=goldark:altar_trigger] at @s run function g_arrow/altar/active/trigger_arrow


#> Sacrifice Mobs & Player
# When a mob walks over or is pushed by the player to atop the Altar, it is locked and consumed as a sacrifice.
# Its soul is then rewarded to the player, allowing them to summon Golden Arrow.
#? Some creatures may have special interactions when sacrificed at an Altar.

execute as @e[type=goldark:altar_spot] at @s run function g_arrow/altar/active/sacrifice

execute as @e[tag=g_arrow:altar.sacrifice] at @s run function g_arrow/altar/active/sacrifice


#> Altar Particles
# An active Altar displays particles around it to indicate it is working.
# A Supercharged Altar will have special particles until it is triggered.
execute as @e[type=goldark:altar_spot] at @s run particle minecraft:mob_portal ~ ~0.8 ~

execute as @e[type=goldark:altar_spot, tag=g_arrow:altar.supercharge] at @s run tp @s ~ ~ ~ ~10
execute as @e[type=goldark:altar_spot, tag=g_arrow:altar.supercharge] at @s run particle minecraft:basic_flame_particle ^ ^0.2 ^


#> Altar Check & Self Destruct
# Every few seconds, the Altar checks itself to guarantee it is still a "valid Altar". If not, it self-destructs and drops all its remaining ingredients on the ground.

scoreboard players add @e[type=goldark:altar_spot] goldark.global.self_clock 1
scoreboard players set @e[type=goldark:altar_spot, scores={goldark.global.self_clock=200..}] goldark.global.self_clock 0

execute as @e[type=goldark:altar_spot] if score @s goldark.global.self_clock matches 1 at @s run playsound portal.portal @a[r=8] ~ ~ ~ 0.8 0.5
execute as @e[type=goldark:altar_spot] if score @s goldark.global.self_clock matches 1 at @s run function g_arrow/altar/check_altar

execute as @e[type=goldark:altar_spot, tag=!g_arrow:altar.is_valid] at @s run function g_arrow/altar/active/self_destruct