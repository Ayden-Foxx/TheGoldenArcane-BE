# * GOLDEN ARROW Has a Weird Taste for GIFTs...

#> Golden Arrow may randomly insert a random item into the PLAYER's inventory.
#> Just like with effects, these may range from literal trash to actually useful stuff.
#> This has no warning to the Player other than a quick sound cue.
#> ------------------------------------------------------------------------------------

# ? Most "trash" items stop appearing once the curse is broken, but rare goods will still be (rarely) gifted.

scoreboard players random @s[scores={goldark.curse_level.g_arrow=1}] goldark.random_tick 1 31
scoreboard players random @s[scores={goldark.curse_level.g_arrow=2..}] goldark.random_tick 9 32


# * "TRASH" ITEMS - May only affect if the Player has not lifted their curse yet.

give @s[scores={goldark.random_tick=1}] bone 1

give @s[scores={goldark.random_tick=2}] arrow 1

give @s[scores={goldark.random_tick=3}] snowball 3

give @s[scores={goldark.random_tick=4}] stick 2

give @s[scores={goldark.random_tick=5}] sapling 1 1

give @s[scores={goldark.random_tick=6}] rotten_flesh 2

give @s[scores={goldark.random_tick=7}] string 2

give @s[scores={goldark.random_tick=8}] bone_meal 2


# * "COMMON" ITEMS - Not too useful, not that crappy. May spawn regardless of curse state.
# ? Perhaps Golden Arrow REALLY likes pumpkins... Or liked while still alive.


give @s[scores={goldark.random_tick=9}] snow 2

give @s[scores={goldark.random_tick=10}] ice 4

give @s[scores={goldark.random_tick=11}] pumpkin 2

give @s[scores={goldark.random_tick=12}] pumpkin_pie 1

give @s[scores={goldark.random_tick=13}] carved_pumpkin 1

give @s[scores={goldark.random_tick=14}] lit_pumpkin 2

give @s[scores={goldark.random_tick=15}] pumpkin_seeds 4

give @s[scores={goldark.random_tick=16}] melon 1

give @s[scores={goldark.random_tick=17}] melon_slice 3

give @s[scores={goldark.random_tick=18}] bread 2

give @s[scores={goldark.random_tick=19}] wool 2

give @s[scores={goldark.random_tick=20}] sweet_berries 4


# * "RARE" ITEMS - Sometimes, when nothing else is chosen...

give @s[scores={goldark.random_tick=21}] gold_ingot 4

give @s[scores={goldark.random_tick=22, goldark.curse_level.g_arrow=1}] skull 1 1
give @s[scores={goldark.random_tick=22, goldark.curse_level.g_arrow=2..}] gold_block 1

give @s[scores={goldark.random_tick=23, goldark.curse_level.g_arrow=1}] redstone 4
give @s[scores={goldark.random_tick=23, goldark.curse_level.g_arrow=2..}] spruce_sign 1

give @s[scores={goldark.random_tick=24}] glowstone_dust 4
give @s[scores={goldark.random_tick=25}] gold_nugget 8
give @s[scores={goldark.random_tick=26}] golden_apple 2
give @s[scores={goldark.random_tick=27}] golden_carrot 3
give @s[scores={goldark.random_tick=28}] glistering_melon_slice 3
give @s[scores={goldark.random_tick=29}] blaze_powder 4
give @s[scores={goldark.random_tick=30}] ghast_tear 1
give @s[scores={goldark.random_tick=31}] magma_cream 2

# ? Custom Item, perhaps? [Soon(tm)]
give @s[scores={goldark.random_tick=32}] emerald 4


# * RESET Random Tick after Function 
scoreboard players reset @s goldark.random_tick