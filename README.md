# 1buttonpaladin
My collection of variations of the 1buttonpally macro created by Qoos, adapted by me for my liking.

I currently use the weapon swap macro in combination with my specific macros for each situation. If I'm going to be using a 2hander, I want it to exectute a different function from when tanking. The basic idea is the same, it will be checking for various conditions and executing attacks with slight differences in each. Each macro will be called by variation of "/script paladin_1button()", as indicated by the function name at the top so they don't counteract each other.

DPS/Solo - Holy Strike/Crusader Strike on cooldown, keeps up wisdom on target, applies and judges righteousness, checks if mob is undead and if so casts exorsism.
--
Edward - Attempts to force proc hand of edward. If Focus buff is applied, cast Holy Light. apply Holy Shield, Holy Strike/Crusader Strike on cooldown, keeps up wisdom on target, applies and judges righteousness, checks if mob is undead and if so casts exorsism.
--
PVP - I currently have this set to Earthshaker so I can spam it to attempt to force proc the AoE stun, while also doing Holy Strike/Crusader Strike on cooldown.
--
Tank - Apply Holy Shield, Holy Strike/Crusader Strike on cooldown, keeps up wisdom on target*, applies and judges righteousness, checks if mob is undead and if so casts exorsism.
--

* I use two variations of the tank macro, the 2nd being without wisdom in the event I have another paladin in group keeping up wisdom so I can just spam righteousness instead for threat.

On my paladin macros I use "/script WeaponSwap("*YOUR 1HAND WEAPON HERE*", "YOUR OPTIONAL SHIELD/OFFHAND HERE*");" at the start of my macro, followed by the command to run the script, followed by /attack. I find that when switching targets, if the macro does not have a spell lined up it will not auto attack, but an addon combined with this command seems to allow you to activate auto attack on target.

For these you will use Super Macro with the two boxes. On the right, you put whichever function you wish to run. On the left, you put the code below.

EX. - Edward Macro

/script paladin_1buttonedward()

/script WeaponSwap("Hand of Edward");

/attack



REQUIRED ADDONS

Coming soon


KNOWN ISSUES:

This macro uses the old set up for crusader strikes where they apply the stacks, so it's not going to work with current Twow update based on that but that section can just be removed. Changes will need to be made to update tanking specs to incorporate Holy Might, seal of command, etc.
