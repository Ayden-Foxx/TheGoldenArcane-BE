#> When a Player interacts with the wrong relic, they're cursed by unknown forces, being
#> forever bound to an old spirit of elder times, Golden Arrow, the now long lost hero.


# The classic laugh, but far more distorted now.
playsound mob.witch.giggle @s ~ ~ ~ 1.5 0.5

# Many, many particles. We love 'em!
particle minecraft:knockback_roar_particle ~ ~1 ~
particle minecraft:totem_particle ~ ~1 ~
particle minecraft:totem_particle ~ ~1 ~
particle minecraft:totem_particle ~ ~1 ~
particle minecraft:totem_particle ~ ~1 ~

# The camera starts shaking...
camerashake add @s 0.3 1 positional

# And now the player is cursed!
tag @s add g_arrow:player.cursed

# (A message is sent in chat to warn of their new conditions...)
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.activate"}]}
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.dark_whisper"}, {"text": " "}, {"translate": "gdark.g_arrow.dialog.first_meeting"}]}