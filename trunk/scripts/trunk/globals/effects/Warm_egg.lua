-----------------------------------
--	Author: Bababooey
--	Warm Egg
--	This egg seems to be warm with life.
--
--	http://wiki.ffxiclopedia.org/wiki/Warm_Egg
--
--	5 Minutes, All Races
--	HP +18
--	MP +18
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,18);
	effect:addMod(MOD_MP,18);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

