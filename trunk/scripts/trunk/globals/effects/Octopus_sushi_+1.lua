-----------------------------------
--	Author: Bababooey
--  Octopus Sushi +1
-- 	The rice is packed to just the right consistency and the suckers on the
--	tentacle still show signs of life. So fresh! 
--
--	http://wiki.ffxiclopedia.org/wiki/Octopus_Sushi_%2B1
--	
--	60 Minutes, All Races
--	Strength +2
--	Accuracy +15-16% (Unconfirmed)
--	????
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,2);
	effect:addMod(MOD_FOOD_ACCP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
