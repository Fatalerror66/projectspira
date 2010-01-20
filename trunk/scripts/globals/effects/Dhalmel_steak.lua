-----------------------------------
--	Author: Bababooey
-- 	Dhalmel Steak
-- 	A great slab of roasted dhalmel meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Dhalmel_Steak
--	
--	3 Hours, All Races
--	Strength +4
--	Intelligence -2
--	Attack +25% (Cap: 45@180 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,45);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
