#> When a mob steps on an active Altar's focus point, it is locked in the structure.
#> After some time, the entity is killed, and its Soul is "harvested" by the Altar.
#> Souls can then be used as a fuel for other rituals, such as Golden Arrow's summoning.


# * Getting a Sacrifice

# When an entity gets in range, it is marked as a Sacrifice. The Altar makes a small audiovisual effect every time a new Sacrifice is targeted.
tag @e[family=mob, family=!ga_boss, r=1.5, c=1] add g_arrow:altar.sacrifice_init

execute as @e[tag=g_arrow:altar.sacrifice_init, r=2] at @s run playsound mob.blaze.breathe @a[r=8] ~ ~ ~ 0.85 0.6
execute as @e[tag=g_arrow:altar.sacrifice_init, r=2] at @s run particle minecraft:knockback_roar_particle

# For every new Sacrifice, the Altar receives +1 score. This is later used to control when a Sacrifice dies or leaves the Altar's range.
execute as @e[tag=g_arrow:altar.sacrifice, r=2] run scoreboard players add @e[type=goldark:altar_spot, c=1] goldark.g_arrow.altar_check 1

# When the above code is done running, the actual tag is added, and the _init is removed.
tag @e[tag=g_arrow:altar.sacrifice_init, r=2] add g_arrow:altar.sacrifice
tag @e[tag=g_arrow:altar.sacrifice, r=2] remove g_arrow:altar.sacrifice_init


# * Killing the Sacrifice

# Sacrifices are debuffed and harmed by the Altar while in its range, until they either die or go off-range.
effect @e[tag=g_arrow:altar.sacrifice] blindness 2 0 true
effect @e[tag=g_arrow:altar.sacrifice] slowness 2 5 true
effect @e[tag=g_arrow:altar.sacrifice] weakness 1 3 false

damage @e[tag=g_arrow:altar.sacrifice, r=2] 4 magic entity @e[type=goldark:altar_spot, c=1]

# A visual indicator is played on/above Sacrifices while they're being consumed.
execute as @e[tag=g_arrow:altar.sacrifice] at @s run particle minecraft:witchspell ~ ~1 ~


# * Profitting off the Sacrificed

# If the entity manages to go out of range from the Altar, it loses the mark and is free to go.
# The Altar plays a special audiovisual indicator when that happens, and updates its number list of current Sacrifices.
execute as @e[tag=g_arrow:altar.sacrifice] at @s unless entity @e[type=goldark:altar_spot, r=1.5] run tag @s add g_arrow:altar.stop_sacrifice

execute as @e[tag=g_arrow:altar.stop_sacrifice] at @s run particle minecraft:critical_hit_emitter
execute as @e[tag=g_arrow:altar.stop_sacrifice] at @s run playsound random.fizz @a[r=8] ~ ~ ~ 0.8 1.2
execute as @e[tag=g_arrow:altar.stop_sacrifice] run scoreboard players reset @e[type=goldark:altar_spot, c=1] goldark.g_arrow.altar_check
execute as @e[tag=g_arrow:altar.stop_sacrifice] run tag @s remove g_arrow:altar.sacrifice
execute as @e[tag=g_arrow:altar.stop_sacrifice] run tag @s remove g_arrow:altar.stop_sacrifice

# Otherwise, if they die in range of an Altar, their Soul adds +1 score to the respective Altar's Soul Bank, which can later be used for other dark rituals.
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=4] run particle minecraft:large_explosion ~ ~0.5 ~
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=4] run playsound mob.blaze.death @a[r=8] ~ ~ ~ 1 0.6
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=4] run scoreboard players add @s goldark.g_arrow.altar_souls 1
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=4] run scoreboard players reset @s goldark.g_arrow.altar_check