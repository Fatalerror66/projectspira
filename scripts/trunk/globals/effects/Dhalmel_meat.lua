-----------------------------------
--	Author: Bababooey
--	Dhalmel Meat
--	Dhalmel meat tastes a bit gamy. It is enjoyed widely over Mindartia.
--
--	http://wiki.ffxiclopedia.org/wiki/Dhalmel_Meat
--
--	5 Minutes, All Races
--	Strength +3
--	Intelligence -5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:subtractMod(MOD_INT,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
