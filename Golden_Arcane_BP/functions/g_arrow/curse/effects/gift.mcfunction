#> >> GOLDEN ARROW Has a Weird Taste for GIFTs...
#> Golden Arrow may randomly insert a random item into the PLAYER's inventory.
#> Just like with effects, these may range from literal trash to actually useful stuff.
#> This has no warning to the Player other than a quick sound cue.

# ? Most "trash" items stop appearing once the curse is broken, but rare goods will still be (rarely) gifted.

scoreboard players random @s[tag=g_arrow:player.cursed] goldark.global.random_tick 1 14
scoreboard players random @s[tag=g_arrow:player.curse_lift] goldark.global.random_tick 7 14

# TODO #1 - Update Item list; Include more Trash & Rare items, add replacement for unobtainable Rare goods once the player completes their Altar?


# * "TRASH" ITEMS - May only affect if the Player has not lifted their curse yet.

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 1 run give @s bone 1

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 2 run give @s arrow 1

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 3 run give @s snowball 3

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 4 run give @s stick 2

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 5 run give @s sapling 1 1

execute if score @s[tag=!g_arrow:player.curse_lift] goldark.global.random_tick matches 6 run give @s rotten_flesh 2


# * "RARE" ITEMS - Sometimes, when nothing else is found...

execute if score @s goldark.global.random_tick matches 7 run give @s gold_ingot 4

execute if score @s[tag=!g_arrow:player.altar_learned] goldark.global.random_tick matches 8 run give @s skull 1 1

execute if score @s[tag=!g_arrow:player.altar_learned] goldark.global.random_tick matches 9 run give @s glowstone_dust 4

execute if score @s[tag=!g_arrow:player.altar_learned] goldark.global.random_tick matches 10 run give @s redstone 4

execute if score @s goldark.global.random_tick matches 11 run give @s gold_nugget 8

execute if score @s goldark.global.random_tick matches 12 run give @s golden_apple 2

execute if score @s goldark.global.random_tick matches 13 run give @s golden_carrot 3

execute if score @s goldark.global.random_tick matches 14 run give @s glistening_watermelon 3