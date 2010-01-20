-----------------------------------
--	Author: Bababooey
-- 	Frog Flambe
-- 	Not your ordinary blackened frog. 
--
--	http://wiki.ffxiclopedia.org/wiki/Frog_Flambe
--	
--	60 Minutes, All Races
--	Dexterity +3
--	Agility +2
--	Mind -2
--	Attack +14% (Cap: 65@464 Base Attack)
--	Ranged Attack +20% (Cap: ???)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3)
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_ATTP,14);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
