-----------------------------------
--	Author: Bababooey
-- 	Salmon Sushi +1
--  Salmon sushi so succulent, you'll make the trek back upstream to get more. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Strength +2
--	Accuracy +15%
--	Ranged Accuracy +15%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,2);
	effect:addMod(MOD_FOOD_ACCP,15);
	effect:addMod(MOD_FOOD_RACCP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
