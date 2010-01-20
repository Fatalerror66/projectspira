-----------------------------------
--	Author: Bababooey
-- 	Roast Trout
--  A shining trout on a stick, grilled with salt. Can also be made with an
--	alabaligi. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Trout
--	
--	30 Minutes, All Races
--	Dexterity +3
--	Mind -1
--	Ranged Attack +14% (Cap: 85@607 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_RATTP,14);
	effect:addMod(MOD_FOOD_RATT_CAP,85);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
