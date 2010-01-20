-----------------------------------
--	Author: Bababooey
-- 	Tender Navarin
-- 	The slow-cooked mutton in this navarin will simply melt in your mouth. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Tender_Navarin
--
--	4 Hours, All Races
--	HP +3%
--  Strength +3
--	Vitality +1
--	Agility +1
--	Intelligence -1
--  Attack +27% (Cap: 35@129 Base Attack)
--  Ranged Attack +27% (Cap: 35@129 Base Ranged Attack)
--	Evasion +6
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,3);
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,35);
	effect:addMod(MOD_FOOD_RATTP,27);
	effect:addMod(MOD_FOOD_RATT_CAP,35);
	effect:addMod(MOD_EVA,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
