#> Destroys the current ALTAR, interrupting any possibly ongoing ritual.


# Breaks the structure itself, dropping any materials on the ground.
fill ~1 ~ ~1 ~-1 ~-1 ~-1 air destroy

# Plays a "explode" effect (with less particles and lower-pitched sound)
particle minecraft:huge_explosion_emitter ~ ~1 ~
playsound random.explode @a[r=12] ~ ~ ~ 1.5 0.4

# If the ALTAR was mid-ritual, it is forced to stop.
execute as @s[tag=g_arrow:altar.trigger] at @s run function g_arrow/altar/active/stop_ritual

# Finally, the custom ALTAR Pointer entity is removed.
kill @s