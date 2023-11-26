#> This function is called when an arrow or altar is no longer valid, but is still trying to summon Golden Arrow.
#> It may also be called manually by functions or the player to force-stop a ritual.


# Stops any ongoing ritual, and removes potential "valid arrows".
tag @e[type=goldark:altar_spot, tag=g_arrow:altar.trigger] remove g_arrow:altar.trigger
kill @e[type=arrow, tag=g_arrow:altar.valid_arrow, c=1]

# Plays a sound & visual effect...
playsound mob.blaze.hit @a[r=12] 1.2 0.4
particle minecraft:knockback_roar_particle ~ ~1 ~

# Warns players of the ritual's failure.
titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.g_arrow.summon.failed"}]}
tellraw @a[rm=16, tag=g_arrow:player.cursed] {"rawtext": [{"text": "§8§l[...] §r"}, {"translate": "gdark.g_arrow.summon.failed"}]}