-----------------------------------
--	Author: Bababooey
--	Derfland Pear
--	A juicy pear favored by the Elvaan.
--
--	http://wiki.ffxiclopedia.org/wiki/Derfland_Pear
--
--	5 Minutes, All Races
--	Agility -3
--	Intelligence +1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_AGI,3);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

