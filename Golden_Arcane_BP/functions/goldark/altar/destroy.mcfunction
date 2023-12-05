#> Destroys the current Altar, interrupting any possibly ongoing ritual.
#> ---------------------------------------------------------------------


# Destroys the Altar structure itself.
fill ~1 ~ ~1 ~-1 ~-1 ~-1 air [] destroy

# Plays an "Explosion" effect on the old location
particle minecraft:huge_explosion_emitter ~ ~1 ~
playsound random.explode @a[r=12] ~ ~ ~ 1.5 0.5

# If a Ritual was running on this Altar, it is also forced to stop.
execute if entity @e[type=goldark:altar_trigger, r=1, c=1] run function goldark/altar/stop_ritual

# Finally, the Altar Pointer is removed.
kill @s