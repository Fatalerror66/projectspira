-----------------------------------
--	Author: Bababooey
-- 	Broiled Trout
-- 	An exceptionally delicious trout on a stick, grilled with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Broiled_Trout
--	
--	60 Minutes, All Races
--	Dexterity +4
--	Mind -1
--	Ranged Attack +14% (Cap: 85@607 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,4);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,85);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
