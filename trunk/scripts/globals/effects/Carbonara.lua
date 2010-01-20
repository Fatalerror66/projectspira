-----------------------------------
--	Author: Bababooey
--	Carbonara
--	A tasty white pasta with a creamy sauce made from Selbina milk and
--	ground black pepper.
--
--	http://wiki.ffxiclopedia.org/wiki/Carbonara
--
--	30 Minutes, All Races
--	Strength +4
--	Vitality +2
--	Intelligence -3
--	HP +14% (Cap: 175@1249 Base HP)
--	MP +10
--	Attack +18% (Cap: 65@361 Base Attack)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_HPP,14);
	effect:addMod(MOD_FOOD_HP_CAP,175);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
