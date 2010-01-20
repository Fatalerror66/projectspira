-----------------------------------
--	Author: Bababooey
--	Ortolana
--	A more than generous serving of assorted vegetables prepared in olive
--	oil, served over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Ortolana
--
--	30 Minutes, All Races
--	Agility +2
--	Vitality +2
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,2);
	effect:addMod(MOD_VIT,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

