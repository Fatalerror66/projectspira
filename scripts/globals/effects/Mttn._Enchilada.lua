-----------------------------------
--	Author: Bababooey
--	Mutton Enchilada
--	This spicy dish is one step above your normal mutton tortilla.
--
--	http://wiki.ffxiclopedia.org/wiki/Mutton_Enchilada
--
--	60 Minutes, All Races
--	Strength +3
--	Vitality +1
--	Intelligence -1
--	MP +10
--	Attack +27% (Cap: 35@129 Base Attack)
--	Ranged Attack +27% (Cap: 35@129 Base Ranged Attack)
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_VIT,1);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,35);
	effect:addMod(MOD_FOOD_RATTP,27);
	effect:addMod(MOD_FOOD_RATT_CAP,35);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

