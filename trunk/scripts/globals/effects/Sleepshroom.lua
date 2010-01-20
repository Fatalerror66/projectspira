-----------------------------------
--	Author: Bababooey
--	Sleepshroom
--	An edible mushroom that grows on funguar.
--
--	http://wiki.ffxiclopedia.org/wiki/Sleepshroom
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
