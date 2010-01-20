-----------------------------------
--	Author: Bababooey
--	Vongole Rosso
--	Red mages across Vana'diel adore this sumptuous blend of tomato sauce and
--	vongola clams over spaghetti al dente.
--
--	http://wiki.ffxiclopedia.org/wiki/Vongole_Rosso
--
--	30 Minutes, All Races
--	Vitality +2
--	Mind -1
--	HP +17% (Cap: 90@529 Base HP)
--	Defense +25% (Cap: 30@120 Base Defense)
--	Store TP +6
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_HPP,17);
	effect:addMod(MOD_FOOD_HP_CAP,90);
	effect:addMod(MOD_FOOD_DEFP,25);
	effect:addMod(MOD_FOOD_DEF_CAP,30);
	effect:addMod(MOD_STORETP,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
