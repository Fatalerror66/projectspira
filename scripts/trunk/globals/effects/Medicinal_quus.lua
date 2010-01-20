-----------------------------------
--	Author: Bababooey
-- 	Medicinal Quus
-- 	The herbs used in this healthy dish are said to have healing properties.
--
--
--	http://wiki.ffxiclopedia.org/wiki/Medicinal_Quus
--	
--	4 Hours, All Races
--	Dexterity +1
--	Mind -1
--	Ranged Accuracy +7% (Cap: 15@214)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,1);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
