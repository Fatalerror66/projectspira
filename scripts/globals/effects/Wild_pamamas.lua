-----------------------------------
--	Author: Bababooey
--	Wild Pamamas
--	These pamamas grow wild on the island of Elshimo.
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Pamamas
--
--	30 Minutes, All Races
--	Strength -3
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,3);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
