-----------------------------------
--	Author: Bababooey
--  Octopus Sushi
-- 	A delicacy hailing from the eastern lands consisting of a cut of octopus
--	laid across subtly flavored rice. 
--
--	http://wiki.ffxiclopedia.org/wiki/Octopus_Sushi
--	
--	30 Minutes, All Races
--	Strength +1
--	Accuracy +15-16%
--	????
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_FOOD_ACCP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
