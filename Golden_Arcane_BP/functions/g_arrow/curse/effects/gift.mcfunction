#> >> GOLDEN ARROW Has a Weird Taste for GIFTs...
#> Golden Arrow may randomly insert a random item into the PLAYER's inventory.
#> Just like with effects, these may range from literal trash to actually useful stuff.
#> This has no warning to the Player other than a quick sound cue.

# ? Most "trash" items stop appearing once the curse is broken, but rare goods will still be (rarely) gifted.

scoreboard players random @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick 1 31
scoreboard players random @s[tag=g_arrow:player.curse_lift] goldark.global.random_tick 9 32


# * "TRASH" ITEMS - May only affect if the Player has not lifted their curse yet.

execute if score @s goldark.global.random_tick matches 1 run give @s bone 1

execute if score @s goldark.global.random_tick matches 2 run give @s arrow 1

execute if score @s goldark.global.random_tick matches 3 run give @s snowball 3

execute if score @s goldark.global.random_tick matches 4 run give @s stick 2

execute if score @s goldark.global.random_tick matches 5 run give @s sapling 1 1

execute if score @s goldark.global.random_tick matches 6 run give @s rotten_flesh 2

execute if score @s goldark.global.random_tick matches 7 run give @s string 2

execute if score @s goldark.global.random_tick matches 8 run give @s bone_meal 2


# * "COMMON" ITEMS - Not too useful, not that crappy. May spawn regardless of curse state.
# ? Perhaps Golden Arrow REALLY likes pumpkins... Or liked while still alive.


execute if score @s goldark.global.random_tick matches 9 run give @s snow 2

execute if score @s goldark.global.random_tick matches 10 run give @s ice 4

execute if score @s goldark.global.random_tick matches 11 run give @s pumpkin 2

execute if score @s goldark.global.random_tick matches 12 run give @s pumpkin_pie 1

execute if score @s goldark.global.random_tick matches 13 run give @s carved_pumpkin 1

execute if score @s goldark.global.random_tick matches 14 run give @s lit_pumpkin 2

execute if score @s goldark.global.random_tick matches 15 run give @s pumpkin_seeds 4

execute if score @s goldark.global.random_tick matches 16 run give @s melon 1

execute if score @s goldark.global.random_tick matches 17 run give @s melon_slice 3

execute if score @s goldark.global.random_tick matches 18 run give @s bread 2

execute if score @s goldark.global.random_tick matches 19 run give @s wool 2

execute if score @s goldark.global.random_tick matches 20 run give @s sweet_berries 4


# * "RARE" ITEMS - Sometimes, when nothing else is chosen...

execute if score @s goldark.global.random_tick matches 21 run give @s gold_ingot 4

execute if score @s[tag=!g_arrow:player.altar_learned] goldark.global.random_tick matches 22 run give @s skull 1 1
execute if score @s[tag=g_arrow:player.altar_learned] goldark.global.random_tick matches 22 run give @s gold_block 1

execute if score @s[tag=!g_arrow:player.altar_learned] goldark.global.random_tick matches 23 run give @s redstone 4
execute if score @s[tag=g_arrow:player.altar_learned] goldark.global.random_tick matches 23 run give @s sign 1

execute if score @s goldark.global.random_tick matches 24 run give @s glowstone_dust 4

execute if score @s goldark.global.random_tick matches 25 run give @s gold_nugget 8

execute if score @s goldark.global.random_tick matches 26 run give @s golden_apple 2

execute if score @s goldark.global.random_tick matches 27 run give @s golden_carrot 3

execute if score @s goldark.global.random_tick matches 28 run give @s glistering_melon_slice 3

execute if score @s goldark.global.random_tick matches 29 run give @s blaze_powder 4

execute if score @s goldark.global.random_tick matches 30 run give @s ghast_tear 1

execute if score @s goldark.global.random_tick matches 31 run give @s magma_cream 2

# ? Custom Item, perhaps? [Soon(tm)]
execute if score @s goldark.global.random_tick matches 32 run give @s emerald 4


# * RESET Random Tick after Function 
scoreboard players reset @s goldark.global.random_tick