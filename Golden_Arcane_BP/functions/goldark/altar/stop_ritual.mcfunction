#> This function interrupts any Ritual in progress on a Golden Altar.
#> ------------------------------------------------------------------


playsound mob.blaze.hit @a[r=12] ~ ~ ~ 1.2 0.4
particle minecraft:knockback_roar_particle ~ ~1 ~

titleraw @a[r=16] actionbar {"rawtext": [{"translate": "gdark.altar.ritual.failed"}]}
tellraw @a[rm=16, scores={goldark.curse_level.any=1..}] {"rawtext": [{"translate": "gdark.altar.ritual.failed"}]}

kill @e[type=arrow, tag=goldark.altar.is_valid, r=1, c=1]