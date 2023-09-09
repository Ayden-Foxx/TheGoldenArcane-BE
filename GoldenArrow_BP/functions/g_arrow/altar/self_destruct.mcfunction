## Destroys the current altar, and stops any ongoing ritual.


# Breaks the structure itself, dropping any materials on the ground.
fill ~1 ~ ~1 ~-1 ~-1 ~-1 air destroy

# Plays a "explode" effect, with less particles and lower-pitched sound.
particle minecraft:huge_explosion_emitter ~ ~1 ~
playsound random.explode @a[r=12] ~ ~ ~ 1.5 0.4

# If a ritual was ongoing on this altar, it is forced to stop.
execute if entity @e[type=g_arrow:summon_ga, r=4] run function g_arrow/altar/active/stop_ritual

# Finally, remove the Altar Pointer, as this is no longer an Altar at all.
kill @s