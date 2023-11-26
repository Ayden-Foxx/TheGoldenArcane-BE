#> When a mob goes above an active altar, its Soul can be harvested.
#> Souls can then be used as a fuel to Golden Arrow's ALTAR.


# When an entity gets too close, it is marked as a Sacrifice. Only one Sacrifice is consumed at a time.
execute as @e[r=1.5, c=1, family=mob, family=!ga_boss] unless entity @e[r=8, tag=g_arrow:altar.sacrifice] run playsound mob.wither.ambient @a[r=8] ~ ~ ~ 1 0.8
execute as @e[r=1.5, c=1, family=mob, family=!ga_boss] unless entity @e[r=8, tag=g_arrow:altar.sacrifice] run particle minecraft:knockback_roar_particle
execute as @e[r=1.5, c=1, family=mob, family=!ga_boss] unless entity @e[r=8, tag=g_arrow:altar.sacrifice] run tag @s add g_arrow:altar.sacrifice

execute if entity @e[r=1.5, tag=g_arrow:altar.sacrifice] unless score @s goldark.g_arrow.altar_check matches 1 run scoreboard players set @s goldark.g_arrow.altar_check 1

# Sacrifices are slowed down, weakened, and slowly consumed until their last bit of health.
effect @e[tag=g_arrow:altar.sacrifice, r=1.5] slowness 1 4 false
effect @e[tag=g_arrow:altar.sacrifice, r=1.5] weakness 2 2 false
effect @e[tag=g_arrow:altar.sacrifice, r=1.5] wither 1 2 false

# Particles are played around the currently targeted Sacrifice.
execute as @e[tag=g_arrow:altar.sacrifice] positioned at ~ ~1 ~ run particle minecraft:conduit_particle


# If the entity exits the ALTAR, it's tag is removed, and the harvesting is interrupted.
# Otherwise, if the ALTAR consumes it completely, the nearest PLAYER receives the harvested Soul.
execute as @e[tag=g_arrow:altar.sacrifice] unless entity @e[type=goldark:altar_spot, r=1.5] run particle minecraft:critical_hit_emitter
execute as @e[tag=g_arrow:altar.sacrifice] unless entity @e[type=goldark:altar_spot, r=1.5] run playsound random.fizz @a[r=8] ~ ~ ~ 0.8 1
execute as @e[tag=g_arrow:altar.sacrifice] unless entity @e[type=goldark:altar_spot, r=1.5] run scoreboard players reset @e[type=goldark:altar_spot, c=1] goldark.g_arrow.altar_check
execute as @e[tag=g_arrow:altar.sacrifice] unless entity @e[type=goldark:altar_spot, r=1.5] run tag @s remove g_arrow:altar.sacrifice

# ? For players:
execute if score @s goldark.g_arrow.altar_check matches 1 if entity @a[tag=g_arrow:altar.sacrifice] unless entity @e[type=player, tag=g_arrow:altar.sacrifice] run particle minecraft:huge_explosion_emitter
execute if score @s goldark.g_arrow.altar_check matches 1 if entity @a[tag=g_arrow:altar.sacrifice] unless entity @e[type=player, tag=g_arrow:altar.sacrifice] run playsound mob.endermen.stare @a[r=8] ~ ~ ~ 1 0.6
execute if score @s goldark.g_arrow.altar_check matches 1 if entity @a[tag=g_arrow:altar.sacrifice] unless entity @e[type=player, tag=g_arrow:altar.sacrifice] run scoreboard players add @a[c=1, tag=g_arrow:player.cursed] goldark.g_arrow.altar_souls 2
execute if score @s goldark.g_arrow.altar_check matches 1 if entity @a[tag=g_arrow:altar.sacrifice] unless entity @e[type=player, tag=g_arrow:altar.sacrifice] run tag @s add g_arrow:altar.supercharge
execute if score @s goldark.g_arrow.altar_check matches 1 if entity @a[tag=g_arrow:altar.sacrifice] unless entity @e[type=player, tag=g_arrow:altar.sacrifice] run scoreboard players reset @s goldark.g_arrow.altar_check

# ? For mobs:
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=8] run particle minecraft:large_explosion
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=8] run playsound mob.blaze.death @a[r=8] ~ ~ ~ 1 0.6
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=8] run scoreboard players add @a[c=1, tag=g_arrow:player.cursed] goldark.g_arrow.altar_souls 1
execute if score @s goldark.g_arrow.altar_check matches 1 unless entity @e[tag=g_arrow:altar.sacrifice, r=8] run scoreboard players reset @s goldark.g_arrow.altar_check