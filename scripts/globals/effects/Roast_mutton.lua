-----------------------------------
--	Author: Bababooey
-- 	Roast Mutton
-- 	A great slab of roasted giant sheep meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Mutton
--	
--	3 Hours, All Races
--	Strength +3
--	Intelligence -1
--	Attack +27% (Cap: 30@111 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
