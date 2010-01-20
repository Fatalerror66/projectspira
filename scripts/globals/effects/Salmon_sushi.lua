-----------------------------------
--	Author: Bababooey
-- 	Salmon Sushi
--  Sliced, raw salmon served on a small portion of sweet vinegar rice--a
--	popular dish in Far Eastern nations. 
--
--	http://wiki.ffxiclopedia.org/wiki/Salmon_Sushi
--	
--	30 Minutes, All Races
--	Strength +1
--	Accuracy +14%
--	Ranged Accuracy +14%
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_FOOD_ACCP,14);
	effect:addMod(MOD_FOOD_RACCP,14);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
