-----------------------------------
--	Author: Bababooey
-- 	Grilled Hare
-- 	Wild rabbit meat roasted on a grill.
--
--	http://wiki.ffxiclopedia.org/wiki/Grilled_Hare
--	
--	3 Hours, All Races
--	Strength +2
--	Intelligence -1
--	Attack +30% (Cap: 15@50 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,2);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,30);
	effect:addMod(MOD_FOOD_ATT_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
