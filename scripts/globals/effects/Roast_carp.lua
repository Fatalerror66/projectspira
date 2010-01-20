-----------------------------------
--	Author: Bababooey
-- 	Roast Carp
-- 	A carp on a stick, grilled with salt. 
--
--	http://wiki.ffxiclopedia.org/wiki/Roast_Carp
--	
--	30 Minutes, All Races
--	Dexterity +1
--	Mind -1
--	Ranged Attack +14%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_RATTP,14);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
