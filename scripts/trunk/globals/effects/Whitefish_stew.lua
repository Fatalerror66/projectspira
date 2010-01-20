-----------------------------------
--	Author: Bababooey
-- 	Medicinal Gruel
-- 	A hearty gruel with medicinal properties.
--
--	http://wiki.ffxiclopedia.org/wiki/Medicinal_Gruel
--
--	3 Hours, All Races
--	HP +10
--	Dexterity +3
--	Mind -3
--	Accuracy +3
--	Ranged Accuracy +7% (Cap: 10)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_DEX,3);
	effect:subtractMod(MOD_MND,3);
	effect:addMod(MOD_ACC,3);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
