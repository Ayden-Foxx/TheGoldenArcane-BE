## # CORE OF ALTAR #
# # This function manages all functions related to Golden Arrow's Altar, and handles their interactions with each other and other files.
# # Each code block is a different function, referenced here to interact with other files.


## Curse Management
# To interact with an Altar, the player must first possess the Golden Curse.
# The curse marks arrows with its own tag, which allows it to interact with other files.

execute as @a[tag=g_arrow:plr_curse] at @s run tag @e[type=arrow, r=2.3] add g_arrow:curse_touch


## Check Altar
# Cursed arrows will search their surrounding terrain for a valid Golden Arrow Altar.
# Detecting one marks the arrow as valid for summoning Golden Arrow.

execute as @e[type=arrow, tag=g_arrow:curse_touch] at @s unless block ~ ~ ~ air run function g_arrow/altar/check


# From there: 

## Trigger Altar
# When a "valid arrow" is found, the next code block handles the Altar's activation.
# Should all conditions match, a new Golden Arrow is summoned from it.

execute as @e[type=arrow, tag=g_arrow:valid_altar] at @s if entity @p[r=12, scores={gdark.g_arrow.souls=1..}] unless entity @e[type=goldark:summon_ga] run scoreboard players add @s gdark.global.self_clock 1

execute as @e[type=arrow, tag=g_arrow:valid_altar, scores={gdark.global.self_clock=80}] at @s if entity @p[scores={gdark.g_arrow.souls=1..}] unless entity @e[type=goldark:summon_ga] run function g_arrow/altar/activate

execute as @e[type=goldark:summon_ga] at @s unless entity @e[type=arrow, tag=g_arrow:valid_altar, r=4] run kill @s


## Sacrifice Mobs & Player
# When a mob walks over or is pushed by the player to atop the Altar, it is locked and consumed as a sacrifice.
# Its soul is then rewarded to the player, allowing them to summon Golden Arrow.
# Some creatures also have special interactions with the Altar when sacrificed.

execute as @e[type=gdark:altar_spot] at @s positioned ~ ~2 ~ as @e[family=!inanimate, family=!undead, r=1.5] run function g_arrow/altar/sacrifice


## Altar Check & Self Destruct
# Every few seconds, the Altar checks itself to guarantee it is still a "valid Altar". If not, it self-destructs and drops all its remaining ingredients on the ground.

scoreboard players add @e[type=gdark:altar_spot] gdark.global.self_clock 1

execute as @e[type=gdark:altar_spot] if score @s gdark.global.self_clock matches 200 at @s run function g_arrow/altar/check

execute as @e[type=gdark:altar_spot, tag=!g_arrow:valid_altar] at @s run function g_arrow/altar/self_destruct