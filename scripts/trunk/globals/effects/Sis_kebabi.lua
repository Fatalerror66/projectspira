-----------------------------------
--	Author: Bababooey
-- 	Sis Kebabi
-- 	Sheep meat and onions on a skewer. Popular in the Near East.
--
--	http://wiki.ffxiclopedia.org/wiki/Sis_Kebabi
--
--	30 Minutes, All Races
--	Strength +6
--	Intelligence -2
--	Vitality -2
--  Attack +20% (Cap: 70@350 Base Attack)
--  Ranged Attack +20% (Cap: 70@350 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:subtractMod(MOD_INT,2);
	effect:subtractMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,70);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,70);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
