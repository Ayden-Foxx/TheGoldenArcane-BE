#> On rare occasions, Golden Arrow might send a cursed foe to the Player.
#> This creature is mostly harmless and simply scares the Player, but their
#> inconvenience may prove deadly while in an actual serious fight.
#> ------------------------------------------------------------------------


scoreboard players random @s goldark.random_tick 1 8

# With a 50/50 chance for either demons or nothing...
execute if score @s goldark.random_tick matches 1 if block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon silverfish "§kFallen PLAGUE§r"

execute if score @s goldark.random_tick matches 2 if block ^-1 ^ ^-8 air if block ^-1 ^2 ^-8 air positioned ^-1 ^ ^-8 run summon stray "§kFallen PLAGUE§r"

execute if score @s goldark.random_tick matches 3 if block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon spider "§kFallen PLAGUE§r"

execute if score @s goldark.random_tick matches 4 if block ^-1 ^ ^-8 air positioned ^-1 ^ ^-8 run summon drowned "§kFallen PLAGUE§r"


# The PLAGUE spawns with some particles indicating its location.
execute as @e[name="§kFallen PLAGUE§r"] at @s run particle minecraft:knockback_roar_particle

# For mobs who can spawn with armor and/or weapons, their 
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.armor.head 0 golden_helmet
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.armor.chest 0 air
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.armor.legs 0 air
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.armor.feet 0 keep golden_boots

replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.weapon.mainhand 0 air
replaceitem entity @e[family=undead, name="§kFallen PLAGUE§r"] slot.weapon.offhand 0 air

# The cursed beast is physically unable to do actual damage, and dies quickly after spawning.
effect @e[name="§kFallen PLAGUE§r"] weakness 9999 9 true
effect @e[name="§kFallen PLAGUE§r"] wither 9999 3 true

# Finally, the creature unleashes a scream, alerting any nearby foes before they attack.
execute positioned as @e[name="§kFallen PLAGUE§r"] run playsound mob.ghast.scream @a[r=8] ^ ^1 ^1 1 0.8