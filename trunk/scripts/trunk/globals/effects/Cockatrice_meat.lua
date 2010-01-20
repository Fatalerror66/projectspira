-----------------------------------
--	Author: Bababooey
--	Cockatrice Meat
--	Cockatrice meat is known for its exquisite flavor.
--
--	http://wiki.ffxiclopedia.org/wiki/Cockatrice_Meat
--
--	5 Minutes, All Races
--	Strength +4
--	Intelligence -6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_INT,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
