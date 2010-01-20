-----------------------------------
--	Author: Bababooey
--	Hare Meat
--	This meat is from a small wild rabbit.
--
--	http://wiki.ffxiclopedia.org/wiki/Hare_Meat
--
--	5 Minutes, All Races
--	Strength +1
--	Intelligence -3
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,1);
	effect:subtractMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

