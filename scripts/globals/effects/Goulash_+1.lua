-----------------------------------
--	Author: Bababooey
-- 	Goulash +1
-- 	A savory bowl of goulash so piping hot that it could warm the bones 
--	of any Bastoker on even the coldest nights. A particularly favored 
--	dish among the Republic's musketeers.
--
--	http://wiki.ffxiclopedia.org/wiki/Goulash_%2B1
--
--	4 Hours All Races
--	Vitality +3
--	Intelligence -2
--	Defense +11% (Cap: 35?@??? Base Defense)
--	Accuracy +11% (Cap: ??@??? Base Accuracy)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_DEFP,11);
	effect:addMod(MOD_FOOD_DEF_CAP,35);
	effect:addMod(MOD_FOOD_ACCP,11);
	effect:addMod(MOD_FOOD_ACC_CAP,35);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
