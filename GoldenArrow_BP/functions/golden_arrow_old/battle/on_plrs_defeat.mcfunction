## If all players are defeated...


execute unless entity @e[type=player, tag=g_arrow:in_battle] run tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.battle.on_end.defeat"}]}

execute as @e[tag=G_Arrow] at @s run particle minecraft:knockback_roar_particle ~ ~1 ~

gamerule doMobLoot false
tp @e[type=stray, tag=G_Arrow] ~ ~-8 ~
kill @e[type=stray, tag=G_Arrow]
gamerule doMobLoot true

playsound mob.wither.ambient @a[tag=g_arrow:in_battle] ~ ~ ~ 1 0.8 
tag @a[tag=g_arrow:in_battle] remove g_arrow:in_battle

tellraw @a {"rawtext": [{"translate": "gdark.g_arrow.battle.on_end.retreat"}]}
