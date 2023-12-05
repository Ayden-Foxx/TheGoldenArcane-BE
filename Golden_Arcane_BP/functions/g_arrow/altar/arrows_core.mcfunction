#> > > CORE of G. ARROW's ALTAR Module < <
#> This is where all of the Module's files and Functions interact,
#> creating the actual Altar Object Players interact with in-game.
#> ----------------------------------------------------------------

# ? Since all of the actual code is located at GoldArk/ALTAR_CORE,
# ? this Function simply manages Golden Arrow's summoning.


#> G_Arrow/RUN_RITUAL -> Trigger Altar
# When an Arrow finds a valid, active Altar, the next code block handles the Altar's triggering.
# Should all conditions be fulfilled, a new Ritual begins at the Altar's Core.

# The external GoldArk/VALIDATE Function checks for all conditions before running the Ritual itself.
execute as @e[type=goldark:altar_spot] at @s if entity @e[type=arrow, tag=goldark.altar.is_valid, r=1] run function goldark/altar/validate

# Should all conditions match, a new Altar Trigger Entity is summoned.
# Here, the code for Golden Arrow's Ritual is ran at the new Entity.
execute as @e[type=goldark:altar_spot, tag=goldark.altar.run_ritual] at @s unless entity @e[type=goldark:altar_trigger, r=8] run summon goldark:altar_trigger "G_Arrow"
execute as @e[type=goldark:altar_spot, tag=goldark.altar.run_ritual] at @s if entity @e[type=goldark:altar_trigger, r=8] run tag @s remove goldark.altar.run_ritual

execute as @e[type=goldark:altar_trigger, name="G_Arrow"] at @s run function g_arrow/altar/start