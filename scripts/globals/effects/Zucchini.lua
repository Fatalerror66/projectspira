-----------------------------------
--	Author: Bababooey
--	Zucchini
--	This edible member of the gourd family is cylindrical in shape and
--	dark green in color.
--
--	http://wiki.ffxiclopedia.org/wiki/Zucchini
--
--	5 Minutes, All Races
--	Agility +1
--	Vitality -3
--	Defense -1
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_VIT,3);
	effect:subtractMod(MOD_DEF,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

