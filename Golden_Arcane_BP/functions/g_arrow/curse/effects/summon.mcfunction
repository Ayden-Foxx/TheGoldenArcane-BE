## On rare occasions, Golden Arrow might send a cursed foe to the Player.
## This creature is mostly harmless and simply scares the Player, but might put them
## in a bad situation, should they be unlucky enough...


scoreboard players random @s gdark.g_arrow.action_tick 1 8


execute if score @s gdark.g_arrow.action_tick matches 1 if block ^-1 ^1 ^-8 air unless block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon silverfish "§kFallen PLAGUE§r"

execute if score @s gdark.g_arrow.action_tick matches 2 if block ^-1 ^1 ^-8 air if block ^-1 ^2 ^-8 air unless block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon stray "§kFallen PLAGUE§r"

execute if score @s gdark.g_arrow.action_tick matches 3 if block ^-1 ^1 ^-8 air unless block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon spider "§kFallen PLAGUE§r"

execute if score @s gdark.g_arrow.action_tick matches 4 if block ^-1 ^1 ^-8 air unless block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon drowned "§kFallen PLAGUE§r"


execute as @e[name="§kFallen PLAGUE§r"] at @s run particle minecraft:knockback_roar_particle

replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.weapon.mainhand 0 air
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.weapon.offhand 0 air

effect @e[name="§kFallen PLAGUE§r"] weakness 99 9 true
effect @e[name="§kFallen PLAGUE§r"] wither 99 0 true

execute positioned as @e[name="§kFallen PLAGUE§r"] run playsound mob.ghast.scream @s ^ ^1 ^1 1 0.8