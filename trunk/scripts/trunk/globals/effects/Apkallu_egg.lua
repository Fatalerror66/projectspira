-----------------------------------
--	Author: Bababooey
--	Apkallu Egg
--	This apkallu egg is a healthy addition to every balanced meal.
--
--	http://wiki.ffxiclopedia.org/wiki/Apkallu_Egg
--
--	5 Minutes, All Races
--	HP +6
--	MP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,6);
	effect:addMod(MOD_MP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
