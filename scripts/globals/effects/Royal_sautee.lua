-----------------------------------
--	Author: Bababooey
-- 	Royal Sautee
-- 	Tender slices of coeurl meat grace this savory dish fit for a king. 
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Sautee
--	
--	4 hours, All Races
--	Stength +5
--	Agility +1
--	Intelligence -2
--	Resist Stun
-- 	Attack +20% (Cap: 80@400 Base Attack)
--	Ranged Attack +20% (Cap: 80@400 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_STUNRES,5);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,80);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,80);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
