-----------------------------------
--	Author: Bababooey
--	Persikos
--	The flesh of this legendary fruit is soft and sweet.
--
--	http://wiki.ffxiclopedia.org/wiki/Persikos
--
--	5 Minutes, All Races
--	Agility -7
--	Intelligence +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,7);
	effect:addMod(MOD_INT,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

