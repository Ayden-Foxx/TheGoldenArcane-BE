#> >> GA's JukeBones - Ol' Tunes from the Afterlife.
#> Occasionally, Golden Arrow might play a few of their favorite tunes,
#> just a bit more low-pitched than usual. Only the PLAYER can hear this music.


scoreboard players random @s goldark.global.random_tick 1 12


execute if entity @s[scores={goldark.global.random_tick=1}] run playsound record.blocks @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=2}] run playsound record.cat @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=3}] run playsound record.chirp @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=4}] run playsound record.far @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=5}] run playsound record.mall @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=6}] run playsound record.mellohi @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=7}] run playsound record.otherside @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=8}] run playsound record.pigstep @s ~ ~ ~ 1.2 0.8

execute if entity @s[scores={goldark.global.random_tick=9}] run playsound record.stal @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=10}] run playsound record.strad @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=11}] run playsound record.wait @s ~ ~ ~ 1 0.5

execute if entity @s[scores={goldark.global.random_tick=12}] run playsound record.ward @s ~ ~ ~ 1 0.5


# * RESET Random Tick after Function 
scoreboard players reset @s goldark.global.random_tick