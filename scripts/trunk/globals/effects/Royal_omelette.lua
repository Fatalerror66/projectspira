-----------------------------------
--	Author: Bababooey
-- 	Royal Omelette
-- 	The traditional egg dish of the San d'Orian royal house.
--
--	http://wiki.ffxiclopedia.org/wiki/Royal_Omelette
--	
--	3 Hours, All Races
--	Strength +5
--	Dexterity +2
--	Intelligence -3
--	Mind +4
--	Attack +22% (Cap: 65@295 Base Attack)
--  Ranged Attack +22% (Cap: 65@295 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_MND,4);
	effect:addMod(MOD_FOOD_ATTP,22);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
	effect:addMod(MOD_FOOD_RATTP,22);
	effect:addMod(MOD_FOOD_RATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
