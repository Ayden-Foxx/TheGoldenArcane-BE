#> > > CORE of GOLDARK's ALTAR Module < <
#> This is where all of the Module's files and Functions interact,
#> creating the actual Altar Object Players interact with in-game.
#> ----------------------------------------------------------------

# * Functions are displayed by their origin file and order of execution.

# ? This is the GLOBAL Altar CORE file. Its Functions manages the Golden Altar
# ? with most of its interactions with the Player and Curses, EXCEPT for Rituals.
# ? These are at their respective sub-Modules' CORE and RITUAL files.



#> CORE -> Curse Imbue
# Arrows near Cursed Players are marked with a "Curse Trigger",
# allowing them to interact with Altars and their mechanics.

# The tag `curse.trigger` is given to any Arrow within a small radius of an accursed Player. The tag allows them to trigger Altars and their behaviors.
execute as @a[scores={goldark.curse_level.g_arrow=1..}] at @s run tag @e[type=arrow, r=4] add goldark.curse.trigger

# Arrows lose this tag when too far away from any other Cursed Player, though.
execute as @e[tag=goldark.curse.trigger] at @s unless entity @a[scores={goldark.curse_level.g_arrow=1..}, r=8] run playsound random.fizz @a[r=12] ~ ~ ~ 0.8 0.8
execute as @e[tag=goldark.curse.trigger] at @s unless entity @a[scores={goldark.curse_level.g_arrow=1..}, r=8] run particle minecraft:knockback_roar_particle
execute as @e[tag=goldark.curse.trigger] at @s unless entity @a[scores={goldark.curse_level.g_arrow=1..}, r=8] run tag @s remove goldark.curse.trigger


#> G_Arrow/CHECK -> Check Altar
# On certain conditions, Cursed Entities may check their surroundings
# for a valid Altar structure, active or not. The result is a tag:

# Initially, any entity who already has the tag is verified to guarantee it is still valid
execute as @e[tag=goldark.altar.is_valid] at @s run function goldark/altar/check

# Arrows are then verified for a potential Altar (if they're above a skull themselves)
execute as @e[tag=goldark.curse.trigger] at @s if block ~ ~ ~ skull run function goldark/altar/check

# Finally, Players holding an Arrow above a skull also have the same check around them.
execute as @e[scores={goldark.curse_level.g_arrow=1..}, hasitem={item=arrow, location=slot.weapon.mainhand}] at @s if block ~ ~ ~ skull run function goldark/altar/check

# * If any of these return a "Valid Altar" response, they will receive a `altar.is_valid` tag.
# * Based on this tag, the Golden Altar runs other behaviors, such as activation and triggering.


#> GoldArk/ACTIVATE -> Activate Altar
# When a Cursed Arrow detects a inactive valid Altar, it activates it.
# The structure is then recognized and behaves as a Golden Arrow Altar.

execute as @e[type=arrow, tag=goldark.altar.is_valid] at @s unless entity @e[type=goldark:altar_spot, r=2] run function goldark/altar/activate


#> GoldArk/SACRIFICE -> Mobs & Player
# When a mob is detected above an Altar, it is locked and consumed as a sacrifice.
# Its Soul Energy is stored in the Altar itself, allowing it to summon Golden Arrow.

execute as @e[type=goldark:altar_spot] at @s run function goldark/altar/sacrifice


#> CORE -> ALTAR's Clock
# The ALTAR CORE Module runs a clock every few seconds, running certain Functions at intervals.

scoreboard players add @e[type=goldark:altar_spot] goldark.self_clock 1
scoreboard players set @e[type=goldark:altar_spot, scores={goldark.self_clock=200..}] goldark.self_clock 0


# * With it, the following Functions and Effects are executed:


#> CORE -> Altar Ambience
# An active Altar displays particles around it to indicate it is working.
# It also plays a Portal Sound Effect every few seconds.

execute as @e[type=goldark:altar_spot] at @s run particle minecraft:mob_portal ~ ~0.8 ~
execute as @e[type=goldark:altar_spot] if score @s goldark.self_clock matches 1 at @s run playsound portal.portal @a[r=8] ~ ~ ~ 0.8 0.5


#> CORE -> Altar Check & Self Destruct
# Every Clock cycle, the Altar checks itself to guarantee it is still a "valid Altar". If not, it self-destructs, dropping any of its placed blocks.

execute as @e[type=goldark:altar_spot] if score @s goldark.self_clock matches 1 at @s run function goldark/altar/check

execute as @e[type=goldark:altar_spot, tag=!goldark.altar.is_valid] at @s run function goldark/altar/destroy