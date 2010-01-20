-----------------------------------
--	Author: Bababooey
--	Dragon Meat
--	This slab of dragon meat remains fresh and juicy.
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Meat
--
--	5 Minutes, All Races
--	Strength +6
--	Intelligence -8
--	Demon Killer
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:subtractMod(MOD_INT,8);
	effect:addMod(MOD_DEMON_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

