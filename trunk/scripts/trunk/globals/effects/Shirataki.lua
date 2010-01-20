-----------------------------------
--	Author: Bababooey
--	Shirataki
--	This stringlike, elastic food is imported from the Far East.
--
--	http://wiki.ffxiclopedia.org/wiki/Shirataki
--
--	5 Minutes, All Races
--	Strength -3
--	Mind +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,3);
	effect:addMod(MOD_MND,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
