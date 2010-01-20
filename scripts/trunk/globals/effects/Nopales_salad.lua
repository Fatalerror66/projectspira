-----------------------------------
--	Author: Bababooey
-- 	Nopales Salad
-- 	A well-rounded salad whose main ingredient is finely diced nopales. 
--
--	http://wiki.ffxiclopedia.org/wiki/Nopales_Salad
--	
--	3 Hours, All Races
--	Strength +1
--	Agility +6
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,1);
	effect:addMod(MOD_AGI,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
