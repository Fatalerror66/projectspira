-----------------------------------
--	Author: Bababooey
--	Pogaca +1
--	75% crispier than the leading pogaca.
--
--	http://wiki.ffxiclopedia.org/wiki/Pogaca_%2B1
--
--	6 Minutes, All Races
--	HP Recovered while healing +6
--	MP Recovered while healing +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,6);
	effect:addMod(MOD_MPHEAL,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

