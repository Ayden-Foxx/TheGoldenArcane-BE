### Golden Arrow has some passive effects which are always active, notoriously with their weaponry.


## # DANCE OF DANGER #
# Golden Arrow's Swords are toggled whenever they're close enough to a player for melee.

# FAR - Fallen Bow, ranged attacks
execute positioned as @s unless entity @a[r=8, m=!c] unless entity @s[tag=g_arrow:lock_weapon] run replaceitem entity @s slot.weapon.mainhand 0 bow
execute positioned as @s unless entity @a[r=8, m=!c] unless entity @s[tag=g_arrow:lock_weapon]  run replaceitem entity @s slot.weapon.offhand 0 air

# CLOSE - Spectre Swords, melee damage
execute positioned as @s if entity @a[r=8, m=!c] unless entity @s[tag=g_arrow:lock_weapon] run replaceitem entity @s  slot.weapon.mainhand 0 golden_sword
execute positioned as @s if entity @a[r=8, m=!c] unless entity @s[tag=g_arrow:lock_weapon] run replaceitem entity @s slot.weapon.offhand 0 golden_sword


## # SPEARS OF DOOM #
# Grants dark powers to arrows Golden Arrow shoots. Not to be confused with CHARGED DOOM.

# Tags new arrows as "Doom Spears"
tag @e[type=arrow, r=2, tag=!g_arrow:charged_doom] add g_arrow:doom_spear

# Sets up a clock for them. The Self_Clock variable from ARCANE PATHS is reused here.
scoreboard players add @e[tag=g_arrow:doom_spear] gdark.global.self_clock 1

# Doom Spears will leave a trail of blue flames on their trajectory
execute as @e[tag=g_arrow:doom_spear] at @s run particle minecraft:blue_flame_particle

# If they hit a player, an evocation fang is summoned where they land.
# It may also still trigger while on ground, if no player had been close enough before.
execute as @e[tag=g_arrow:doom_spear, tag=!g_arrow:evoked] at @s if entity @a[r=2.4, rm=2.2] run summon evocation_fang ^ ^ ^1
execute as @e[tag=g_arrow:doom_spear, tag=!g_arrow:evoked] at @s as @a[r=2.2] run summon evocation_fang ~ ~ ~
execute as @e[tag=g_arrow:doom_spear, tag=!g_arrow:evoked] at @s if entity @a[r=2.4] run tag @s add g_arrow:evoked

# If the arrow doesn't hit anything for 5 seconds, it despawns in a mini-explosion
execute as @e[tag=g_arrow:doom_spear, scores={gdark.global.self_clock=100}] at @s run particle minecraft:large_explosion
kill @e[tag=g_arrow:doom_spear, scores={gdark.global.self_clock=100}]