#> This function is called to remove an Altar, generally when its strucure is no longer valid.
#> If a Ritual was running on it before, it is stopped and displays a failure message.
#> -------------------------------------------------------------------------------------------


# If an Arrow is detected on this Altar, an external Function is run to interrupt it.
execute if entity @e[type=arrow, tag=goldark.altar.is_valid, r=1, c=1] run function goldark/altar/stop_ritual

# An audiovisual effect is played when the structure is destroyed
particle minecraft:huge_explosion_emitter
particle minecraft:knockback_roar_particle

playsound mob.ghast.fireball @a[r=8] ~ ~ ~ 1 0.5

kill @s[type=goldark:altar_spot]