#> Whenever a Player is holding an ingredient for the Golden Arrow Altar,
#> but has not built one yet, this shows the item's proper placement, as
#> a (slightly intrusive) way to indicate that item is required for the Altar.
#> ---------------------------------------------------------------------------


# * Cross of Gold;

execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.2 ~3.5
execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}] run particle minecraft:endrod ~1.5 ~0.2 ~2.5
execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.2 ~1.5
execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}] run particle minecraft:endrod ~-0.5 ~0.2 ~2.5

execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.gold] run titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.dialog.altar_recipe.cross"}]}

execute if entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.gold] run tag @s add g_arrow.player.is_holding.gold
execute unless entity @s[hasitem={item=gold_block, location=slot.weapon.mainhand}, tag=g_arrow.player.is_holding.gold] run tag @s remove g_arrow.player.is_holding.gold


# * Core of Glowstone;

execute if entity @s[hasitem={item=glowstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.5 ~2.5

execute if entity @s[hasitem={item=glowstone, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.glowstone] run titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.dialog.altar_recipe.center"}]}

execute if entity @s[hasitem={item=glowstone, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.glowstone] run tag @s add g_arrow.player.is_holding.glowstone
execute unless entity @s[hasitem={item=glowstone, location=slot.weapon.mainhand}, tag=g_arrow.player.is_holding.glowstone] run tag @s remove g_arrow.player.is_holding.glowstone


# * Ring of Redstone;

execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~-0.5 ~0.2 ~3.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.2 ~3.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~1.5 ~0.2 ~3.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~1.5 ~0.2 ~2.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~1.5 ~0.2 ~1.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.2 ~1.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~-0.5 ~0.2 ~1.5
execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}] run particle minecraft:endrod ~-1.5 ~0.2 ~2.5

execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.redstone] run titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.dialog.altar_recipe.ring"}]}

execute if entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.redstone] run tag @s add g_arrow.player.is_holding.redstone
execute unless entity @s[hasitem={item=redstone, location=slot.weapon.mainhand}, tag=g_arrow.player.is_holding.redstone] run tag @s remove g_arrow.player.is_holding.redstone


# * And a Skull Above.

execute if entity @s[hasitem={item=skull, location=slot.weapon.mainhand}] run particle minecraft:endrod ~0.5 ~0.8 ~2.5

execute if entity @s[hasitem={item=skull, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.skull] run titleraw @s actionbar {"rawtext": [{"translate": "gdark.g_arrow.dialog.altar_recipe.focus"}]}

execute if entity @s[hasitem={item=skull, location=slot.weapon.mainhand}, tag=!g_arrow.player.is_holding.skull] run tag @s add g_arrow.player.is_holding.skull
execute unless entity @s[hasitem={item=skull, location=slot.weapon.mainhand}, tag=g_arrow.player.is_holding.skull] run tag @s remove g_arrow.player.is_holding.skull