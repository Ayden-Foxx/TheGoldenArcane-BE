## The game wants you to fight Golden Arrow, not run from them. I guess.


effect @s slowness 2 3 false
effect @s weakness 2 2 true
effect @s darkness 6 0 true

titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.battle.attempt_flee"}]}


effect @e[tag=G_Arrow] speed 5 3 true

execute as @e[type=stray, tag=G_Arrow, rm=28] at @s run tp @a[tag=g_arrow:in_battle, rm=28] ^ ^2 ^16 facing ^ ^1 ^15