# * G. Arrow's Cursed DIALOGUE Box.

#> While cursed, the player might receive various messages randomly. These messages are based on various factors,
#> occasionally causing direct effects on the player themselves. This is one of the CURSE Module's main file.
#> --------------------------------------------------------------------------------------------------------------

# ? Some dialogues and effects may change or stop occurring once the Player breaks their curse.

scoreboard players random @s goldark.random_tick 1 16


# .1 - Greets 
tellraw @s[scores={goldark.random_tick=1}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.greet"}]}

# .2 - Kill
execute if entity @s[scores={goldark.random_tick=2, goldark.curse_level.g_arrow=..2}] if entity @e[family=!inanimate, type=!wolf, tag=!goldark.paths.werewoof, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.kill"}]}

# .3 - Loot
execute if entity @s[scores={goldark.random_tick=3}] if entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.loot"}]}
execute if entity @s[scores={goldark.random_tick=3}] if entity @e[type=arrow, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[type=item, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.loot"}]}
execute if entity @s[scores={goldark.random_tick=3}] if entity @e[type=xp_orb, r=8] unless entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.loot"}]}

# .4 - Watch
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ snow run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ frosted_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ packed_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ blue_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ planks run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}
execute if entity @s[scores={goldark.random_tick=4}, y=0..] if block ~ ~-1 ~ spruce_log run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.watch"}]}

# .5 - Summon
tellraw @s[scores={goldark.random_tick=5, goldark.curse_level.g_arrow=1}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.summon_not_found"}]}
tellraw @s[scores={goldark.random_tick=5, goldark.curse_level.g_arrow=2}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.summon_found"}]}

effect @s[scores={goldark.random_tick=5, goldark.curse_level.g_arrow=..2}] darkness 8 0 true

# .6 - Dance
execute if entity @s[scores={goldark.random_tick=6}] unless entity @e[family=monster, r=8] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.dance"}]}

execute if entity @s[scores={goldark.random_tick=6, goldark.curse_level.g_arrow=..2}] unless entity @e[family=monster, r=8] run summon minecraft:tnt_minecart "4UWLuv" ~ ~5 ~

execute if entity @s[scores={goldark.random_tick=6}] unless entity @e[family=monster, r=8] run effect @s speed 10 1 true
execute if entity @s[scores={goldark.random_tick=6}] unless entity @e[family=monster, r=8] run effect @s haste 10 2 true

execute if entity @s[scores={goldark.random_tick=6, goldark.curse_level.g_arrow=..2}] unless entity @e[family=monster, r=8] run particle minecraft:knockback_roar_particle ~ ~1 ~
execute if entity @s[scores={goldark.random_tick=6}] unless entity @e[family=monster, r=8] run particle minecraft:totem_particle ~ ~1 ~

execute if entity @s[scores={goldark.random_tick=6, goldark.curse_level.g_arrow=..2}] unless entity @e[family=monster, r=8] run playsound ambient.cave @s ^ ^ ^ 1.2 0.8
execute if entity @s[scores={goldark.random_tick=6, goldark.curse_level.g_arrow=3..}] unless entity @e[family=monster, r=8] run playsound random.levelup @s ~ ~ ~ 1 1.5

# .7 - Bore
execute if entity @s[scores={goldark.random_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.bore"}]}

execute if entity @s[scores={goldark.random_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run playsound mob.wolf.whine @s ^ ^ ^ 1 0.85

# .8 - [Illude]
tellraw @s[scores={goldark.random_tick=8, goldark.curse_level.g_arrow=..2}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.illusion"}]}
titleraw @s[scores={goldark.random_tick=8, goldark.curse_level.g_arrow=..2}] actionbar {"rawtext": [{"text": "§7§k[!!TenebraeAscendio!!]"}]}
execute if entity @s[scores={goldark.random_tick=8, goldark.curse_level.g_arrow=..2}] run function g_arrow/curse/effects/summon

# .9 - Woof
tellraw @s[scores={goldark.random_tick=9}, tag=goldark.paths.werewoof] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.woof"}]}
execute if entity @s[scores={goldark.random_tick=9}, tag=!goldark.paths.werewoof] if entity @e[type=wolf, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.woof"}]}

# .10 - Blood
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=goldark.paths.vempyre] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=wooden_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=golden_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=stone_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=iron_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=diamond_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}
execute if entity @s[scores={goldark.random_tick=10, goldark.curse_level.g_arrow=..2}, tag=!goldark.paths.vempyre, hasitem={item=netherite_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.blood"}]}

# .11 - Sleep
execute if entity @s[scores={goldark.random_tick=11}] if entity @e[type=phantom] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.sleep"}]}

# .12 - [Hint ALTAR]
tellraw @s[scores={goldark.random_tick=12, goldark.curse_level.g_arrow=1}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.hint_altar.recipe"}]}
tellraw @s[scores={goldark.random_tick=12, goldark.curse_level.g_arrow=2..}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.hint_altar.recipe"}]}

# .13 - Warn
tellraw @s[scores={goldark.random_tick=13}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.warn"}]}

# .14 - [Confuse/Reject]
tellraw @s[scores={goldark.random_tick=14, goldark.curse_level.g_arrow=1}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.confuse"}]}
tellraw @s[scores={goldark.random_tick=14, goldark.curse_level.g_arrow=2..}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.reject"}]}

# .15 - Hot
execute if entity @s[scores={goldark.random_tick=15}] if block ~ ~-1 ~ campfire run tag @s add g_arrow.player.overheat
execute if entity @s[scores={goldark.random_tick=15}] if block ~ ~-1 ~ magma run tag @s add g_arrow.player.overheat
execute if entity @s[scores={goldark.random_tick=15}] if block ~ ~ ~ fire run tag @s add g_arrow.player.overheat
# The tag `player.overheat` is added when a Player is in/above a fire block.
execute if entity @s[scores={goldark.random_tick=15}] if block ~ ~ ~ lava run tag @s add g_arrow.player.overheat

tellraw @s[tag=g_arrow.player.overheat] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.hot"}]}

effect @s[tag=g_arrow.player.overheat] fire_resistance 30 1 true

tag @s[tag=g_arrow.player.overheat] remove g_arrow.player.overheat

# .16 - [Protect]
execute if entity @s[scores={goldark.random_tick=16, goldark.curse_level.g_arrow=1}] at @e[family=monster, r=16] run scoreboard players add @s goldark.delay.quaternary 1

tellraw @s[scores={goldark.random_tick=16, goldark.delay.quaternary=6..}] {"rawtext": [{"translate": "gdark.g_arrow.curse.dialog.protect"}]}

execute if entity @s[scores={goldark.random_tick=16, goldark.delay.quaternary=6..}] run function g_arrow/curse/effects/protect


# * RESET Random Tick after Function 
scoreboard players reset @s goldark.random_tick