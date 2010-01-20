-----------------------------------
--	Author: Bababooey
-- 	Salmon Meuniere +1
--  This salmon meuniere is so delicious that it will bring you to tears. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Meuniere_%2B1
--	
--	4 Hours, All Races
--	Dexterity +2
--	Mind -2
--	Ranged Accuracy +7% (Cap: 15@214)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,2);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_RACCP,7);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
