-----------------------------------
--	Author: Bababooey
--	Buffalo Meat
--	A succulent slab of fresh buffalo meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Buffalo_Meat
--
--	5 Minutes, All Races
--	Strength +4
--	Agility -5
--	Intelligence -7
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_AGI,5);
	effect:subtractMod(MOD_INT,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

