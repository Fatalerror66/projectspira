-----------------------------------
--	Author: Bababooey
--	Smilodon Liver
--	Smilodon livers are said to enhance virility.
--
--	http://wiki.ffxiclopedia.org/wiki/Smilodon_Liver
--
--	5 Minutes, All Races
--	Strength +5
--	Intelligence -7
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:subtractMod(MOD_INT,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

