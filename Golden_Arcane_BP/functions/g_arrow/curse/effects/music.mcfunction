#* G.A.'s JukeBones - Ol' Tunes from the Afterlife.

#> Occasionally, Golden Arrow might play a few of their favorite tunes,
#> just a bit more low-pitched than usual. Only the PLAYER can hear this music.
#> ----------------------------------------------------------------------------


scoreboard players random @s goldark.random_tick 1 12


playsound record.blocks @s[scores={goldark.random_tick=1}] ~ ~ ~ 1 0.5

playsound record.cat @s[scores={goldark.random_tick=2}] ~ ~ ~ 1 0.5

playsound record.chirp @s[scores={goldark.random_tick=3}] ~ ~ ~ 1 0.5

playsound record.far @s[scores={goldark.random_tick=4}] ~ ~ ~ 1 0.5

playsound record.mall @s[scores={goldark.random_tick=5}] ~ ~ ~ 1 0.5

playsound record.mellohi @s[scores={goldark.random_tick=6}] ~ ~ ~ 1 0.5

playsound record.othersi @s[scores={goldark.random_tick=7}] ~ ~ ~ 1 0.5

playsound record.pigstep @s[scores={goldark.random_tick=8}] ~ ~ ~ 1.2 0.8

playsound record.stal @s[scores={goldark.random_tick=9}] ~ ~ ~ 1 0.5

playsound record.strad @s[scores={goldark.random_tick=10}] ~ ~ ~ 1 0.5

playsound record.wait @s[scores={goldark.random_tick=11}] ~ ~ ~ 1 0.5

playsound record.ward @s[scores={goldark.random_tick=12}] ~ ~ ~ 1 0.5


# * RESET Random Tick after Function 
scoreboard players reset @s goldark.random_tick