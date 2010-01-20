-----------------------------------
--	Author: Bababooey
-- 	Boiled Cockatrice
-- 	A stew made out of cockatrice meat, boiled to tender perfection. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Cockatrice
--	3 hours, All Races
--  Strength +5
--	Agility +2
--  Intelligence -2
--	Mind +1
--  Attack +22% (Cap: 60@272 Base Attack)
--  Ranged Attack +22% (Cap: 60@272 Base Ranged Attack)
--  Resist Petrify
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_ATTP,22);
	effect:addMod(MOD_FOOD_ATT_CAP,60);
	effect:addMod(MOD_FOOD_RATTP,22);
	effect:addMod(MOD_FOOD_RATT_CAP,60);
	effect:addMod(MOD_PETRIFYRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
