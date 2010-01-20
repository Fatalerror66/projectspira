-----------------------------------
--	Author: Bababooey
--	Imperial Coffee
--	Strong coffee brewed in Al Zahbi.
--
--	http://wiki.ffxiclopedia.org/wiki/Imperial_Coffee
--
--	3 Hours, All Races
--	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,3);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

