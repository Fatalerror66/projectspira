-----------------------------------
--	Author: Bababooey
-- 	Fin Sushi +1
-- 	When the fins taste this good, who needs the rest of the fish? 
--
--	http://wiki.ffxiclopedia.org/wiki/Fin_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Intelligence +5
--	Accuracy +17%
--	Ranged Accuracy +17%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,5);
	effect:addMod(MOD_FOOD_ACCP,17);
	effect:addMod(MOD_FOOD_RACCP,17);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
