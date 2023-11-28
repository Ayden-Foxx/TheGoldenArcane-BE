#> >> GA's Cursed DIALOGUE Box.
#> While cursed, the player might receive various messages randomly. These messages are based on various factors,
#> occasionally causing direct effects on the player themselves. This is, in a way, the CURSE Module's main file.

# ? Some dialogues and effects may change or stop occurring once the Player breaks their curse.

scoreboard players random @s goldark.global.random_tick 1 16


# .1 - Greets 
execute if entity @s[scores={goldark.global.random_tick=1}] if entity @e[family=undead, family=!wither, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.whisper"}, {"translate": "gdark.g_arrow.dialog.greet"}]}

# .2 - Kill
execute if entity @s[scores={goldark.global.random_tick=2}, tag=!g_arrow:player.curse_lift] if entity @e[family=!inanimate, type=!wolf, r=16] unless entity @e[type=player, tag=!goldark:paths.werewoof, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.kill"}]}
execute if entity @s[scores={goldark.global.random_tick=2}, tag=!g_arrow:player.curse_lift] if entity @e[type=player, tag=!goldark:paths.werewoof, r=16] unless entity @e[family=!inanimate, type=!wolf, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.kill"}]}

# .3 - Loot
execute if entity @s[scores={goldark.global.random_tick=3}] if entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}
execute if entity @s[scores={goldark.global.random_tick=3}] if entity @e[type=arrow, r=8] unless entity @e[type=item, r=8] unless entity @e[type=xp_orb, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}
execute if entity @s[scores={goldark.global.random_tick=3}] if entity @e[type=xp_orb, r=8] unless entity @e[type=item, r=8] unless entity @e[type=arrow, r=8] unless entity @e[family=monster, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.loot"}]}

# .4 - Watch
execute if entity @s[scores={goldark.global.random_tick=4},y=80, dy=200] if block ~ ~-1 ~ snow run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ frosted_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ packed_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ blue_ice run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ planks run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}
execute if entity @s[scores={goldark.global.random_tick=4}, y=80, dy=200] if block ~ ~-1 ~ log run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.watch"}]}

# .5 - Summon
execute if entity @s[scores={goldark.global.random_tick=5}, tag=!g_arrow:player.altar_learned, tag=!g_arrow:player.curse_lift] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.summon_not_found"}]}
execute if entity @s[scores={goldark.global.random_tick=5}, tag=g_arrow:player.altar_learned, tag=!g_arrow:player.curse_lift] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.summon_found"}]}

execute if entity @s[scores={goldark.global.random_tick=5}, tag=!g_arrow:player.curse_lift] run effect @s nausea 8 0 true

# .6 - Dance
execute if entity @s[scores={goldark.global.random_tick=6}] unless entity @e[family=monster, r=6] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.dance"}]}

execute if entity @s[scores={goldark.global.random_tick=6}, tag=!g_arrow:player.curse_lift] unless entity @e[family=monster, r=6] run effect @s nausea 10 0 true
execute if entity @s[scores={goldark.global.random_tick=6}] unless entity @e[family=monster, r=6] run effect @s speed 10 1 true
execute if entity @s[scores={goldark.global.random_tick=6}] unless entity @e[family=monster, r=6] run effect @s haste 10 2 true

execute if entity @s[scores={goldark.global.random_tick=6}, tag=!g_arrow:player.curse_lift] unless entity @e[family=monster, r=6] run particle minecraft:knockback_roar_particle ~ ~1 ~
execute if entity @s[scores={goldark.global.random_tick=6}] unless entity @e[family=monster, r=6] run particle minecraft:totem_particle ~ ~1 ~

execute if entity @s[scores={goldark.global.random_tick=6}, tag=!g_arrow:player.curse_lift] unless entity @e[family=monster, r=6] run playsound ambient.cave @s ^ ^ ^ 1.2 1.2
execute if entity @s[scores={goldark.global.random_tick=6}, tag=g_arrow:player.curse_lift] unless entity @e[family=monster, r=6] run playsound random.explode @s ~ ~ ~ 1 1.5

# .7 - Bore
execute if entity @s[scores={goldark.global.random_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.bore"}]}

execute if entity @s[scores={goldark.global.random_tick=7}] if entity @e[family=!inanimate, type=!item, r=16] run playsound mob.wolf.whine @s ^ ^ ^ 1 0.85

# .8 - [Illude]
execute if entity @s[scores={goldark.global.random_tick=8}, tag=!g_arrow:player.curse_lift] unless entity @e[family=!inanimate, r=8] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.illusion"}]}
execute if entity @s[scores={goldark.global.random_tick=8}, tag=!g_arrow:player.curse_lift] unless entity @e[family=!inanimate, r=8] run titleraw @s actionbar {"rawtext": [{"text": "§7§k[!!TenebraeAscendio!!]"}]}
execute if entity @s[scores={goldark.global.random_tick=8}, tag=!g_arrow:player.curse_lift] unless entity @e[family=!inanimate, r=8] run function g_arrow/curse/effects/illusion

# .9 - Woof
execute if entity @s[scores={goldark.global.random_tick=9}, tag=goldark:paths.werewoof] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.woof"}]}
execute if entity @s[scores={goldark.global.random_tick=9}, tag=!goldark:paths.werewoof] if entity @e[type=wolf, r=8] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.woof"}]}

# .10 - Blood
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=goldark:paths.vempyre] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=wooden_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=golden_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=stone_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=iron_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=diamond_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}
execute if entity @s[scores={goldark.global.random_tick=10}, tag=!g_arrow:player.curse_lift, tag=!goldark:paths.vempyre, hasitem={item=netherite_sword, location=slot.weapon.mainhand}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.blood"}]}

# .11 - Sleep
execute if entity @s[scores={goldark.global.random_tick=11}] if entity @e[type=phantom] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.sleep"}]}

# .12 - [Hint ALTAR]
execute if entity @s[scores={goldark.global.random_tick=12}, tag=!g_arrow:player.altar_learned] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.hint_altar.recipe"}]}

# .13 - Warn
execute if entity @s[scores={goldark.global.random_tick=13}] if entity @e[family=piglin, r=16] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.warn"}]}

execute if entity @s[scores={goldark.global.random_tick=13}, hasitem={item=gold_ingot}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.warn"}]}
execute if entity @s[scores={goldark.global.random_tick=13}, hasitem={item=gold_nugget}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.warn"}]}
execute if entity @s[scores={goldark.global.random_tick=13}, hasitem={item=raw_gold}] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.warn"}]}

# .14 - [Confuse/Reject]
execute if entity @s[scores={goldark.global.random_tick=14}, tag=!g_arrow:player.altar_learned] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.confuse"}]}
execute if entity @s[scores={goldark.global.random_tick=14}, tag=g_arrow:player.altar_learned] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.reject"}]}
execute if entity @s[scores={goldark.global.random_tick=14}, tag=g_arrow:player.curse_lift] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.reject"}]}

# .15 - Hot
execute if entity @s[scores={goldark.global.random_tick=15}] if block ~ ~-1 ~ magma run tag @s add g_arrow:player.overheat
execute if entity @s[scores={goldark.global.random_tick=15}] if block ~ ~ ~ fire run tag @s add g_arrow:player.overheat
execute if entity @s[scores={goldark.global.random_tick=15}] if block ~ ~ ~ lava run tag @s add g_arrow:player.overheat

execute if entity @s[scores={goldark.global.random_tick=15}, tag=g_arrow:player.overheat] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.hot"}]}

execute if entity @s[scores={goldark.global.random_tick=15}, tag=g_arrow:player.overheat] run effect @s fire_resistance 30 1 true

execute if entity @s[scores={goldark.global.random_tick=15}, tag=g_arrow:player.overheat] run tag @s remove g_arrow:player.overheat

# .16 - [Protect]
execute if entity @s[scores={goldark.global.random_tick=16}] if entity @e[family=undead, r=12] run tellraw @s {"rawtext": [{"translate": "gdark.g_arrow.dialog.protect"}]}

execute if entity @s[scores={goldark.global.random_tick=16}] if entity @e[family=undead, r=12] run function g_arrow/curse/effects/protect