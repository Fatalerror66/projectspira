-----------------------------------
--	Author: Bababooey
--	Marinara Pizza +1
--	Ahoy there, captain! You've hauled in the ultimate in
--	seafood pizzas, simply loaded with succulent morsels of only the
--	finest ocean delights.
--
--	http://wiki.ffxiclopedia.org/wiki/Marinara_Pizza_%2B1
--
--	4 Hours, All Races
--	HP +25
--	Attack +21% (Cap: 55)
--	Accuracy +11% (Cap: 44)
--	Undead Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_FOOD_ATTP,21);
	effect:addMod(MOD_FOOD_ATT_CAP,55);
	effect:addMod(MOD_FOOD_ACCP,11);
	effect:addMod(MOD_FOOD_ACC_CAP,44);
	effect:addMod(MOD_UNDEAD_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

