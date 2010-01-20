-----------------------------------
--	Author: Bababooey
-- 	Hydra Kofte
-- 	A dish made from grilled ground hydra meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Hydra_Kofte
--	
--	3 Hours, All Races
--	Strength +7
--	Intelligence -3
--	Attack +20% (Cap: 150@750 Base Attack)
--  Ranged Attack +20% (Cap: 150@750 Base Attack)
--	Defense +25% (Cap: 70@280 Base Defense)
--	Resist Poison
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,7);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,150);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,150);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,70);
	effect:addMod(MOD_POISONRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
