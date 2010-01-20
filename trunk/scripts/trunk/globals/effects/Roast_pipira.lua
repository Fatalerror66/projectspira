-----------------------------------
--	Author: Bababooey
-- 	Roast Pipira
-- 	A pipira on a stick, grilled with salt.
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Pipira
--	
--	30 Minutes, All Races
--	Dexterity +3
--	Mind -1
--	Attack +14% (Cap: 85@607 Base Attack)
--	Ranged Attack +14% (Cap: 85@607 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_ATTP,14);
	effect:addMod(MOD_FOOD_ATT_CAP,80);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,80);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
