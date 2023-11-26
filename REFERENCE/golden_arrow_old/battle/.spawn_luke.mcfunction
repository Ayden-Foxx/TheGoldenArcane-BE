## # Secret Function? -- On defeat, Golden
# Arrow has a rare chance to summon a special
# wolf, called "Luke". This is a reference to
# "Our Tales", where upon the defeat of the
# original Golden Arrow, a stray wolf came to
# Ayden's house, and without any other living
# being nearby, he decided to adopt it,
# naming them "Luke". Luke was a loyal
# friend, a brave doggo, and a great
# companionship. The last moment Ayden was in
# Our Tales, before it was destroyed, Luke
# was on his side, and stayed with him until
# the last moment. This is a tribute to him,
# the now ascended doggo who lives in a
# better place, where bones are plenty and
# the dangers are gone.
#
# This is for you, little doggy.



summon wolf "§8§7Luke" ^-1 ^1 ^-1

tag @e[type=wolf, name="§8§7Luke", r=12] add g_arrow:luke

event entity @e[type=wolf, tag=g_arrow:luke] minecraft:entity_born


effect @e[tag=g_arrow:luke] regeneration 9999999 2 true
effect @e[tag=g_arrow:luke] resistance 9999999 1 true
effect @e[tag=g_arrow:luke] strength 9999999 0 true
effect @e[tag=g_arrow:luke] speed 9999999 0 true


execute as @e[tag=g_arrow:luke] at @s run particle minecraft:totem_particle ~ ~0.5 ~
execute as @e[tag=g_arrow:luke] at @s run particle minecraft:totem_particle ~ ~0.5 ~
execute as @e[tag=g_arrow:luke] at @s run particle minecraft:knockback_roar_particle ~ ~0.5 ~

execute as @a[r=12, tag=g_arrow:in_battle] at @s run playsound mob.wolf.bark @s ^-8 ^1 ^-8 2 1.5