-----------------------------------
--	Author: Bababooey
-- 	Dhalmel Pie
-- 	A savory pie made from dhalmel meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Dhalmel_Pie
--	
--	30 Minutes, All Races
--	HP +25
--	Strength +4
--	Vitality +1
--	Agility +2
--	Intelligence -2
--	Mind +1
--	Attack +25% (Cap: 45@180 Base Attack)
--  Ranged Attack +25% (Cap: 45@180 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_STR,4);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_MND,1);
	effect:addMod(MOD_FOOD_ATTP,25);
	effect:addMod(MOD_FOOD_ATT_CAP,45);
	effect:addMod(MOD_FOOD_RATTP,25);
	effect:addMod(MOD_FOOD_RATT_CAP,45);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
