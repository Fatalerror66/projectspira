-----------------------------------
--	Author: Bababooey
--	Rock Cheese
--	This cheese is even harder than stone cheese.
--
--	http://wiki.ffxiclopedia.org/wiki/Rock_Cheese
--
--	60 Minutes, All Races
--	HP Recovered while healing +1
--	HP +6% (Cap: 45)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_HP_CAP,45);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

