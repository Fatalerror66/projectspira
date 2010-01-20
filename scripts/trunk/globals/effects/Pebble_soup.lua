-----------------------------------
--	Author: Bababooey
-- 	Pebble Soup
-- 	Heated rocks are placed in this white gruel to keep it warm. 
--
--	http://wiki.ffxiclopedia.org/wiki/Pebble_Soup
--
--	3 Hours, All Races
--	HP Recovered while healing +2
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
