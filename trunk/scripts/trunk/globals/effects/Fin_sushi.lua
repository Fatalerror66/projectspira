-----------------------------------
--	Author: Bababooey
-- 	Fin Sushi
-- 	Sliced, raw kalkanba served on a small portion of sweet vinegar rice, a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Fin_Sushi
--	
--	30 Minutes, All Races
--	Intelligence +5
--	Accuracy +16%
--	Ranged Accuracy +16%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,5);
	effect:addMod(MOD_FOOD_ACCP,16);
	effect:addMod(MOD_FOOD_RACCP,16);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
