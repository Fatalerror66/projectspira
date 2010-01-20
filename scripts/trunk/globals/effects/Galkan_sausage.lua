-----------------------------------
--	Author: Bababooey
-- 	Galkan Sausage
-- 	A traditional Galkan sausage made with giant sheep meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Galkan_Sausage
--	
--	30 Minutes, All Races
--	Strength +3
--	Intelligence -4
--	Attack +9
--	Ranged Attack +9
--
--	30 Minuets, Galka Only
--	Strength +3
--	Intelligence -1
--	Attack +25% (Cap: 30@120 Base Attack)
--	Ranged Attack +25% (Cap: 30@120 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	race = target:getRace();
	if(race ~= 8) then	'Not Galkan
		effect:addMod(MOD_STR,3);
		effect:subtractMod(MOD_INT,4);
		effect:addMod(MOD_ATT,9);
		effect:addMod(MOD_RATT,9);
	else
		effect:addMod(MOD_STR,3);
		effect:subtractMod(MOD_INT,1);
		effect:addMod(MOD_FOOD_ATTP,25);
		effect:addMod(MOD_FOOD_ATT_CAP,30);
		effect:addMod(MOD_FOOD_RATTP,25);
		effect:addMod(MOD_FOOD_RATT_CAP,30);
	end;
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
