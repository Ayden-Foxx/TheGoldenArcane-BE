## When too many creatures approach the Player, Golden Arrow has a chance
## to simply remove all hostile creatures in a large radius.


particle minecraft:totem_particle ~ ~1 ~

playsound mob.wolf.growl @s ^ ^1 ^-1 1 0.7

execute as @e[family=monster, r=16] at @s run particle minecraft:knockback_roar_particle
execute as @e[family=monster, r=16] at @s run effect @s wither 20 4 false
execute as @e[family=monster, r=16] at @s run tp @s ^ ^-8 ^-1


execute as @e[type=arrow, r=16] at @s run particle minecraft:large_explosion
kill @e[type=arrow, r=16]