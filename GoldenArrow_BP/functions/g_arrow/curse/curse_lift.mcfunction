## After defeating Golden Arrow in a (hopefully) fair fight, the Player is "lifted" of their curse.
## Truth is, Golden Arrow never leaves them; The Player merely earns their respect.
## After winning a battle this way, the Player might still have positive effects, though...


# So so many particles. Kinda inverted from "curse_player.mcfunction"...
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:knockback_roar_particle ~ ~2 ~
particle minecraft:totem_particle ~ ~2 ~
particle minecraft:totem_particle ~ ~2 ~

# A low-pitched bell plays to the Player.
playsound block.bell.hit @s ~ ~1 ~ 1 0.5

# Their tag is updated; Now they're free of their cursed burden.
tag @s remove g_arrow:player.cursed
tag @s add g_arrow:player.curse_lifted

# A notice, a last message, and a farewell. This is the end.
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.lift"}]}
tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.fallen_whisper.familiar"}, {"text": " "}, {"translate": "gdark.g_arrow.dialog.last_message"}]}