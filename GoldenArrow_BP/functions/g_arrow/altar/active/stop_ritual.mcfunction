## This function is called when an arrow or altar is no longer valid, but is still trying to summon Golden Arrow.
# It may also be called manually by functions or the player to force-stop a ritual.


# Stop the ongoing ritual, and remove any "valid arrow".
kill @e[type=g_arrow:summon_ga]
kill @e[type=arrow, tag=g_arrow:misc.valid_altar]

# Plays a sound & visual effect...
playsound mob.blaze.hit @a[r=12] 1 0.4
particle minecraft:knockback_roar_particle ~ ~1 ~

# Warns players of the ritual's failure.
titleraw @a[rm=24] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.failed"]}
tellraw @a[rm=24] {"rawtext": [{"text": "§8§l[...] §r"}, {"translate": "gdark.g_arrow.summon.failed"]}