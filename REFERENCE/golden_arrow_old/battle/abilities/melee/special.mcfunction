## DASH - "Dashes" to the nearest player.
# While technically a "stealth mode" instead of an actual dash, it's still close enough to be considerable the same here.

# Plays a sound/visual cue to tell when Golden Arrow begins performing a Dash.
execute if entity @s[scores={gdark.global.self_clock=100}] as @a[r=12] at @s run playsound mob.wither.shoot @s ^ ^ ^1 1 1.5
execute if entity @s[scores={gdark.global.self_clock=100..102}] run particle minecraft:large_explosion ~ ~1 ~

# And also adds a tag to give GA the appropriate effects & particles.
execute if entity @s[scores={gdark.global.self_clock=100}] run tag @s add g_arrow:dashing

# Their gear also disappears for the sake of this effect.
replaceitem entity @s[tag=g_arrow:dashing] slot.armor.head 0 air
replaceitem entity @s[tag=g_arrow:dashing] slot.armor.chest 0 air
replaceitem entity @s[tag=g_arrow:dashing] slot.armor.legs 0 air
replaceitem entity @s[tag=g_arrow:dashing] slot.armor.feet 0 air

replaceitem entity @s[tag=g_arrow:dashing] slot.weapon.mainhand 0 air
replaceitem entity @s[tag=g_arrow:dashing] slot.weapon.offhand 0 air

# Grants some effects while Golden Arrow is dashing.
effect @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=100}] invisibility 2 0 true
effect @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=100}] speed 2 1 true
effect @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=100}] resistance 2 4 true
effect @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=100}] weakness 2 1 true

# A blue flame keeps track of GA's position.
execute if entity @s[tag=g_arrow:dashing] run particle minecraft:blue_flame_particle ~ ~1.2 ~

# After the dash ends, another visual cue shows the player who's much closer now...
execute if entity @s[scores={gdark.global.self_clock=139..140}] run particle minecraft:knockback_roar_particle ~ ~1 ~
execute if entity @s[scores={gdark.global.self_clock=139..140}] as @a[r=12] at @s run playsound random.explode @s ^ ^ ^ 1 2

# GA's armor is returned once the dash ends.
replaceitem entity @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=140}] slot.armor.head 0 golden_helmet
replaceitem entity @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=140}] slot.armor.chest 0 golden_chestplate
replaceitem entity @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=140}] slot.armor.legs 0 golden_leggings
replaceitem entity @s[tag=g_arrow:dashing, scores={gdark.global.self_clock=140}] slot.armor.feet 0 golden_boots

# And now the game knows the dash is done.
execute if entity @s[scores={gdark.global.self_clock=140}] run tag @s remove g_arrow:dashing