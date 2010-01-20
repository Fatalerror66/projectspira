-----------------------------------
--	Author: Bababooey
--	Stone Cheese
--	A hard cheese made from giant sheep's milk.
--
--	http://wiki.ffxiclopedia.org/wiki/Stone_Cheese
--
--	30 Minutes, All Races
--	HP +6% (Cap: 40)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,40);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

