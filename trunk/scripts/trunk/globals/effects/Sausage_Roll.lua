-----------------------------------
--	Author: Bababooey
--	Sausage Roll
--	A sandwich made with bread wrapped around a sausage.
--
--	http://wiki.ffxiclopedia.org/wiki/Sausage_Roll
--
--	30 Minutes, All Races
--	Vitality +3
--	Intelligence -1
--	HP +6% (Cap: ???)
--	Attack +27% (Cap: 30@111 Base Attack)
--	Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_HPP,6);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,30);
	effect:addMod(MOD_FOOD_RATTP,27);
	effect:addMod(MOD_FOOD_RATT_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

