-----------------------------------
--	Author: Bababooey
--	Goblin Drink
--	This Goblin Beverage is a mix of various strained vegetables
--
--	http://wiki.ffxiclopedia.org/wiki/Goblin_Drink
--
--	3 Hours, All Races
--	MP Recovered while healing +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

