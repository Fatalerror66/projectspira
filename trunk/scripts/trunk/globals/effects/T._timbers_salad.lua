-----------------------------------
--	Author: Bababooey
-- 	Timbre Timbers Salad
-- 	This special tossed salad is an exact replica of the one 
--	served at the Timbre Timbers Tavern in Windurst.
--
--	http://wiki.ffxiclopedia.org/wiki/Timbre_Timbers_Salad
--	
--	4 Hours, All Races
--	MP +20
--	Vitality -1
--	Agility +5
--	Ranged Accuracy +8% (Cap: 15@188)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,20);
	effect:subtractMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,5);
	effect:addMod(MOD_FOOD_RACCP,8);
	effect:addMod(MOD_FOOD_RACC_CAP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
