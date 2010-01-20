-----------------------------------
--	Author: Bababooey
--	Salsa
--	A zesty sauce used by chefs specializing in dishes originating
--	in the Far West.
--
--	http://wiki.ffxiclopedia.org/wiki/Salsa
--
--	3 Minutes, All Races
--	Strength -1
--	Dexterity -1
--	Agility -1
--	Vitality -1
--	Mind -1
--	Intelligence -1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:subtractMod(MOD_STR,1);
	effect:subtractMod(MOD_DEX,1);
	effect:subtractMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,1);
	effect:subtractMod(MOD_MND,1);
	effect:subtractMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

