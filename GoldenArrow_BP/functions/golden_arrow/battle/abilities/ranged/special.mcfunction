execute if entity @s[scores={gdark.global.self_clock=300, gdark.g_arrow.action_tick=41..}] unless entity @a[r=2, m=!c] run effect @s instant_damage 1 3 true
execute if entity @s[scores={gdark.global.self_clock=298..300, gdark.g_arrow.action_tick=46..}] unless entity @a[r=3, m=!c] run particle minecraft:totem_particle ~ ~1 ~

# They also heal regularly every few seconds,
# while also inflicting Weakness to players
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @a[r=2, m=!c] run effect @s instant_damage 10 2 true
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @a[r=2, m=!c] run effect @a[r=16] weakness 9 1 true

execute if entity @s[scores={gdark.global.self_clock=390..400}] unless entity @a[r=1.5, m=!c] run particle minecraft:basic_smoke_particle ^ ^1.5 ^1
execute if entity @s[scores={gdark.global.self_clock=1}] unless entity @a[r=1.5, m=!c] run particle minecraft:knockback_roar_particle ^ ^1.5 ^1