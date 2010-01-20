-----------------------------------
--	Author: Bababooey
--	Vongole Rosso +1
--	In a recent survey, 87% of all vongola clams replied spaghetti vongole +1 is
--	the way they'd like to go.
--
--	http://wiki.ffxiclopedia.org/wiki/Vongole_Rosso_%2B1
--
--	60 Minutes, All Races
--	Vitality +2
--	Mind -1
--	HP +20% (Cap: 95@475 Base HP)
--	Defense +25% (Cap: 35@140 Base Defense)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_HPP,20);
	effect:addMod(MOD_FOOD_HP_CAP,95);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,35);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

