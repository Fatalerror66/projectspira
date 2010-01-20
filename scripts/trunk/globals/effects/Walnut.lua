-----------------------------------
--	Author: Bababooey
--	Walnut
--	This hard-shelled nut comes from trees of the same name.
--
--	http://wiki.ffxiclopedia.org/wiki/Walnut
--
--	3 Minutes, All Races
--	HP +30
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
