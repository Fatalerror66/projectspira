-----------------------------------
--	Author: Bababooey
-- 	Batagreen Sautee
-- 	A dish of Batagreens, sauteed in Selbina butter.
--
--	http://wiki.ffxiclopedia.org/wiki/Batagreen_Sautee
--	
--	3 Hours, All Races
--	Vitailty -2
--	Agility +1
--	Ranged Accuracy +7% (Cap: 15@214)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_VIT,2);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
