#> When too many creatures approach the Player, Golden Arrow has a chance
#> to simply remove all hostile creatures in a large radius around them.
#> ----------------------------------------------------------------------


# A particle is played on the protected player.
particle minecraft:totem_particle ~ ~1 ~

# An angry wolf can be heard behind...
playsound mob.wolf.growl @s ^ ^1 ^-1 1 0.7


# Any monsters in a decent radius are consumed by Earth itself, to perish devoid of the skies.
execute as @e[family=monster, r=16] at @s run particle minecraft:knockback_roar_particle
execute as @e[family=monster, r=16] at @s run effect @s wither 20 4 false
execute as @e[family=monster, r=16] at @s run tp @s ^ ^-8 ^-1

# Arrows are also destroyed wherever they are. (Unless they're being used in a Golden Arrow ALTAR)
execute as @e[type=arrow, tag=!goldark.altar.is_valid, r=16] at @s run particle minecraft:large_explosion
kill @e[type=arrow, tag=!goldark.altar.is_valid, r=16]