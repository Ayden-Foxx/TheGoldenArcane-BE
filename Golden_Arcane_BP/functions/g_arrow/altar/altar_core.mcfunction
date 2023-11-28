#> > > CORE OF ALTAR < <
# * This function manages all functions related to Golden Arrow's Altar, and handles their interactions with each other and other files.
# * Each code block is a different function, referenced here to interact with other files.


#> Curse Management
# To interact with an Altar, the player must first possess the Golden Curse.
# The curse marks arrows with its own tag, which allows it to interact with other files.

execute as @a[tag=g_arrow:player.cursed] at @s run tag @e[type=arrow, r=2.35] add g_arrow:player.curse_touch

# Armor Stands also temporarily receive this same tag for activating an Altar.
execute as @a[tag=g_arrow:player.cursed] at @s run tag @e[type=armor_stand, r=1.5] add g_arrow:player.curse_touch

execute as @e[type=armor_stand, tag=g_arrow:player.curse_touch] at @s unless entity @a[tag=g_arrow:player.cursed, r=2.5] run tag @s remove g_arrow:player.curse_touch


#> Check Altar
# Cursed Arrows/Armor Stands will search their surrounding terrain for a valid Golden Arrow Altar.
# Detecting one marks the object as valid for future interactions.

execute as @e[tag=g_arrow:player.curse_touch] at @s unless block ~ ~ ~ air run function g_arrow/altar/check_altar


# * From there:


#> Activate Altar
# An Armor Stand on a valid, yet inactive Altar activates it, allowing the Player to properly interact with the structure.

execute as @e[type=armor_stand, tag=g_arrow:altar.is_valid] at @s unless entity @e[type=goldark:altar_spot, r=2] run function g_arrow/altar/activate


#> Trigger Altar
# When a "valid arrow" is found, the next code block handles the Altar's triggering.
# Should all conditions match, a new Golden Arrow is summoned from it.

execute as @e[scores={goldark.g_arrow.altar_souls=1..}] at @s if entity @e[type=arrow, tag=g_arrow:altar.is_valid, r=1] unless entity @e[type=goldark:golden_arrow] unless entity @e[type=goldark:altar_trigger] run function g_arrow/altar/check_trigger

execute as @e[type=goldark:altar_trigger] at @s run function g_arrow/altar/active/trigger_arrow

execute as @e[type=goldark:altar_trigger] at @s unless entity @e[type=arrow, tag=g_arrow:altar.is_valid, r=8] run function g_arrow/altar/active/stop_ritual


#> Sacrifice Mobs & Player
# When a mob walks over or is pushed by the player to atop the Altar, it is locked and consumed as a sacrifice.
# Its soul is then rewarded to the player, allowing them to summon Golden Arrow.
#? Some creatures also have special interactions with the Altar when sacrificed.

execute as @e[type=goldark:altar_spot] at @s run function g_arrow/altar/sacrifice


## Altar Check & Self Destruct
# Every few seconds, the Altar checks itself to guarantee it is still a "valid Altar". If not, it self-destructs and drops all its remaining ingredients on the ground.

scoreboard players add @e[type=goldark:altar_spot] goldark.global.self_clock 1

execute as @e[type=goldark:altar_spot] at @s unless entity @e[type=goldark:altar_trigger] run particle minecraft:enchanting_table_particle

execute as @e[type=goldark:altar_spot] if score @s goldark.global.self_clock matches 200 at @s run playsound portal.portal @a[r=8] ~ ~ ~ 0.8 0.5
execute as @e[type=goldark:altar_spot] if score @s goldark.global.self_clock matches 200 at @s run function g_arrow/altar/check_altar

execute as @e[type=goldark:altar_spot, tag=!goldark:altar.is_valid] at @s run function g_arrow/altar/active/self_destruct