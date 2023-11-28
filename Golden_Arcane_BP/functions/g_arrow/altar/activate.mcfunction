#> When a proper ALTAR Structure is found, but it is still inactive,
#> this function activates it and marks the structure as a valid ALTAR.

# ! Do note the ALTAR Spot will quickly self-destruct if the ALTAR is broken later!

particle minecraft:knockback_roar_particle
particle minecraft:totem_particle

playsound portal.ignite @a[r=8] ~ ~ ~ 1 0.5

summon goldark:altar_spot ~ ~-1 ~

kill @s