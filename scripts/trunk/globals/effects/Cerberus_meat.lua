-----------------------------------
--	Author: Bababooey
--	Cerberus Meat
--	This Cerberus meat gives off heat even though it has never been cooked.
--
--	http://wiki.ffxiclopedia.org/wiki/Cerberus_Meat
--
--	30 Minutes, All Races
--	Strength +6
--	Intelligence -6
--	HP +10
--	MP -10
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:subtractMod(MOD_INT,6);
	effect:addMod(MOD_HP,10);
	effect:subtractMod(MOD_MP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
