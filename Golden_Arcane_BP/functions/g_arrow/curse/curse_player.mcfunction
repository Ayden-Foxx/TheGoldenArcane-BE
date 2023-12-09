#> When a Player interacts with the wrong relic, they're cursed by ancient forces to be
#> forever bound to an old spirit of former times, Golden Arrow, the Fallen Hero.
#> ------------------------------------------------------------------------------------


# A Delay begins at the start. After each interval, the Function Effects are played.
scoreboard players add @s[scores={goldark.delay.primary=..129}] goldark.delay.primary 1

# At the first tick, a message is displayed to the Player...
tellraw @s[scores={goldark.delay.primary=1}] {"rawtext": [{"translate": "gdark.g_arrow.curse.on_trigger.a"}]}
# ...Then another follow-up after a few seconds.
tellraw @s[scores={goldark.delay.primary=80}] {"rawtext": [{"translate": "gdark.g_arrow.curse.on_trigger.a"}]}


# * Then, the rest of the actual cursing is executed.


# A distorted sound plays to the Player.
playsound mob.elderguardian.curse @s[scores={goldark.delay.primary=120}] ~ ~1 ~ 1.25 0.4

# Many, many particles. We love 'em!
execute if entity @s[scores={goldark.delay.primary=120..125}] run particle minecraft:knockback_roar_particle ~ ~1 ~
execute if entity @s[scores={goldark.delay.primary=120..123}] run particle minecraft:totem_particle ~ ~1 ~

# The camera starts shaking...
execute if entity @s[scores={goldark.delay.primary=120}] run camerashake add @s 0.1 1 positional

# Thunders roar everywhere...
execute if entity @s[scores={goldark.delay.primary=130}] run weather thunder

# And now the player is cursed!
scoreboard players set @s[scores={goldark.delay.primary=120}] goldark.curse_level.g_arrow 1
scoreboard players set @s[scores={goldark.delay.primary=120, goldark.curse_level.any=..0}] goldark.curse_level.g_arrow 1


# The Delay variable is reset at the end of the Function.
scoreboard players reset @s[scores={goldark.delay.primary=130}] goldark.delay.primary