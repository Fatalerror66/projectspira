-----------------------------------
--	Author: Bababooey
--	Imperial Coffee +1
--	A rich aroma wafts from this cup of Imperial coffee.
--
--	http://wiki.ffxiclopedia.org/wiki/Imperial_Coffee%2B1
--
--	4 Hours, All Races
--	HP Recovered while healing +5
--	MP Recovered while healing +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,5);
	effect:addMod(MOD_MPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

