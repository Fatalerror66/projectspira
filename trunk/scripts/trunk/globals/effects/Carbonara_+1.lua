-----------------------------------
--	Author: Bababooey
--	Carbonara +1
--	This spaghetti carbonara is so creamy, the word "creamy" isn't creamy enough
--	to describe its creaminess.
--
--	http://wiki.ffxiclopedia.org/wiki/Carbonara_%2B1
--
--	60 Minutes, All Races
--	Strength +4
--	Vitality +2
--	Intelligence -3
--	HP +14% (Cap: 180@1285 Base HP)
--	MP +15
--	Attack +18% (Cap: 70@388 Base Attack)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_HPP,14);
	effect:addMod(MOD_FOOD_HP_CAP,180);
	effect:addMod(MOD_MP,15);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,70);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

