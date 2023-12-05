#> When a proper Altar Structure is found, but it is still inactive,
#> this function activates it and marks the structure as a valid Altar.
#> --------------------------------------------------------------------


particle minecraft:knockback_roar_particle
particle minecraft:totem_particle

playsound portal.ignite @a[r=8] ~ ~ ~ 1 0.5

execute align xyz positioned ~0.5 ~ ~0.5 run summon goldark:altar_spot

kill @s[type=!player]