-----------------------------------
--	Author: Bababooey
--	Honey
--	Bees make this sweet honey from flower nectar.
--
--	http://wiki.ffxiclopedia.org/wiki/Honey
--
--	5 Minutes, All Races
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
