-----------------------------------
--	Author: Bababooey
-- 	Broiled Carp
-- 	An exceptionally delicious carp on a stick, grilled with salt.
--
--	http://wiki.ffxiclopedia.org/wiki/Broiled_Carp
--	
--	60 Minutes, All Races
--	Dexterity +2
--	Mind -1
--	Ranged Attack +14%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_RATTP,14);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
