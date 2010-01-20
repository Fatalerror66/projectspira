-----------------------------------
--	Author: Bababooey
--	Danceshroom
--	An edible mushroom that grows on funguar.
--
--	http://wiki.ffxiclopedia.org/wiki/Danceshroom
--
--	5 Minutes, All Races
--	Strength -5
--	Mind +3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,5);
	effect:addMod(MOD_MND,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
