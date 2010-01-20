-----------------------------------
--	Author: Bababooey
-- 	Coeurl Sautee
-- 	Coeurl meat sauteed in olive oil.
--
--	http://wiki.ffxiclopedia.org/wiki/Coeurl_Sautee
--	
--	3 hours, All Races
--	Stength +5
--	Agility +1
--	Intelligence -2
--	Resist Stun
-- 	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_STUNRES,5);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,75);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
