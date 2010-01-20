-----------------------------------
--	Author: Bababooey
-- 	Sausage
-- 	Smoked sausages made by filling a sheep's intestines with mutton.  
--
--	http://wiki.ffxiclopedia.org/wiki/Sausage
--	
--	30 Minutes, All Races
--	HP +3%
--	Strength +3
--	Intelligence -1
--	Attack +27% (Cap: 30@111 Base Attack)
--	Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,3);
	effect:addMod(MOD_STR,3);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,30);
	effect:addMod(MOD_FOOD_RATTP,27);
	effect:addMod(MOD_FOOD_RATT_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
