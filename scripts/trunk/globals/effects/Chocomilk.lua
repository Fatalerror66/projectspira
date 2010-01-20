-----------------------------------
--	Author: Bababooey
--	Chocomilk
--	A frothy drink made of kukuru beans. Popular in Bastok.
--
--	http://wiki.ffxiclopedia.org/wiki/Chocomilk
--
--	3 Hours, All Races
--	MP Recovered while healing +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
