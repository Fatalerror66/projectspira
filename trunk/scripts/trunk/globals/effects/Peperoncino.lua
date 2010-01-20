-----------------------------------
--	Author: Bababooey
--	Peperoncino
--	A simple pasta dish made with olive oil and peppers.
--
--	http://wiki.ffxiclopedia.org/wiki/Peperoncino
--
--	30 Minutes, All Races
--	Vitality +2
--	HP +30% (Cap: 70@233 Base HP)
--	Store TP +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_HPP,30);
	effect:addMod(MOD_FOOD_HP_CAP,70);
	effect:addMod(MOD_STORETP,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

