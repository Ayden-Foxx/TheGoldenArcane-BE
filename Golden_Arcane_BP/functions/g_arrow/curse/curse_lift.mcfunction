#> After defeating Golden Arrow in a (hopefully) fair fight, the Player is "lifted" off their curse.
#> Truth is, Golden Arrow never leaves them; The Player merely earns their respect.
#> After winning a battle this way, the Player might still have positive effects, though...


# So so many particles. Kinda inverted from "curse_player.mcfunction"...
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:totem_particle ~ ~2 ~
particle minecraft:totem_particle ~ ~2 ~
particle minecraft:totem_particle ~ ~2 ~

# A low-pitched bell plays to the Player.
playsound block.bell.hit @s ~ ~2 ~ 1 0.3

# The skies become clear in relief.
weather clear

# They receive a new tag, "freeing" them of their cursed burden.
tag @s add g_arrow:player.curse_lift

# A notice, a last message, and a farewell. This is the end.
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.lift"}]}
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.fallen_whisper.familiar"}, {"text": " "}, {"translate": "gdark.g_arrow.dialog.last_message"}]}