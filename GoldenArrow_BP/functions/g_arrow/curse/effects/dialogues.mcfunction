## Golden Arrow's Dialogue Box.
# Each of these may randomly be sent to a cursed player while doing various activities.
# Some of them might have extra effects besides text, too.


scoreboard players random @s gdark.g_arrow.action_tick 1 16


# .1 - Greet
execute if entity @s[scores={gdark.g_arrow.action_tick=1}] if entity @e[family=undead, family=!wither, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.greet"}]}


# .2 - Kill
execute if entity @s[scores={gdark.g_arrow.action_tick=2}, tag=!g_arrow:curse_lift] if entity @e[family=!inanimate, type=!wolf, r=16] unless entity @e[family=player, tag=!gdark:werewoof, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.kill"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=2}, tag=!g_arrow:curse_lift] if entity @e[family=player, tag=!gdark:werewoof, r=16] unless entity @e[family=!inanimate, type=!wolf, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.kill"}]}


# .3 - Loot
execute if entity @s[scores={gdark.g_arrow.action_tick=3}] if entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=3}] if entity @e[type=arrow, r=8] unless entity @e[type=item, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=3}] if entity @e[type=xp_orb, r=8] unless entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}


# .4 - Watch
execute if entity @s[scores={gdark.g_arrow.action_tick=4}, y=80..] if block ~ ~-1 ~ snow run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=4}] if block ~ ~-1 ~ ice if entity @s[y=80..] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=4}] if block ~ ~-1 ~ packed_ice if entity @s[y=80..] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=4}] if block ~ ~-1 ~ blue_ice if entity @s[y=80..] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=4}] if block ~ ~-1 ~ planks 1 if entity @s[y=80..] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=4}] if block ~ ~-1 ~ log 1 if entity @s[y=80..] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}


# .5 - Summon
execute if entity @s[scores={gdark.g_arrow.action_tick=5}, tag=!g_arrow:altar_learned, tag=!g_arrow:curse_lift] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.summon_not_found"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=5}, tag=g_arrow:altar_learned, tag=!g_arrow:curse_lift] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.summon_found"}]}


# .6 - Dance
execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.dance"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run effect @s nausea 10 0 true

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run effect @s speed 10 1 true

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run effect @s haste 10 2 true

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run particle minecraft:knockback_roar_particle ~ ~1 ~

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run particle minecraft:totem_particle ~ ~1 ~

execute if entity @s[scores={gdark.g_arrow.action_tick=6}] unless entity @e[family=monster, r=6] run playsound ambient.cave @s ~ ~ ~ 1.2 0.7


# .7 - Bore
execute if entity @s[scores={gdark.g_arrow.action_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.bore"}]}

execute if entity @s[scores={gdark.g_arrow.action_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run playsound mob.wolf.whine @s ~ ~ ~ 1 0.25


# 8. [Illusions]
execute if entity @s[scores={gdark.g_arrow.action_tick=8}] unless entity @e[family=!inanimate, r=8] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.illusion"}]}

# ...