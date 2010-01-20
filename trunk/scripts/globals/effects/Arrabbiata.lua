-----------------------------------
--	Author: Bababooey
--	Arrabbiata
--	A delightful blend of pomodoro sauce and dragon meat served over spaghetti
--	al dente, with enough mustard to make your eyes pop in surprise.
--
--	http://wiki.ffxiclopedia.org/wiki/Arrabbiata
--
--	30 Minutes, All Races
--	Strength +5
--	Vitality +2
--	Intelligence -7
--	HP +12% (Cap: 150@1250 Base HP)
--	Attack +23% (Cap: 120@533 Base Attack)
--	Store TP +5
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,7);
	effect:addMod(MOD_FOOD_HPP,12);
	effect:addMod(MOD_FOOD_HP_CAP,150);
	effect:addMod(MOD_FOOD_ATTP,23);
	effect:addMod(MOD_FOOD_ATT_CAP,120);
	effect:addMod(MOD_STORETP,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
