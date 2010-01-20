-----------------------------------
--	Author: Bababooey
-- 	Salmon Meuniere
--  These eggs of the freshwater Cheval salmon
--	are said to be a rare delicacy.
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Eggs
--	
--	3 Hours, All Races
--	Dexterity +2
--	Mind -2
--	Ranged Accuracy +7% (Cap: 10@143)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
