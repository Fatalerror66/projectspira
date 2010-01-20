-----------------------------------
--	Author: Bababooey
--	Pogaca
--	A crispy, yogurt-flavored bread.
--
--	http://wiki.ffxiclopedia.org/wiki/Pogaca
--
--	5 Minutes, All Races
--	HP Recovered while healing +4
--	MP Recovered while healing +4
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,4);
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

