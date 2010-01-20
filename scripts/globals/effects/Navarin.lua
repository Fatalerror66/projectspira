-----------------------------------
--	Author: Bababooey
-- 	Navarin
-- 	A meal of stewed giant sheep meat. 
-- 
--	http://wiki.ffxiclopedia.org/wiki/Navarin
--
--	3 Hours, All Races
--	HP +3%
--  Strength +3
--	Vitality +1
--	Agility +1
--	Intelligence -1
--  Attack +27% (Cap: 30@111 Base Attack)
--  Ranged Attack +27% (Cap: 30@111 Base Ranged Attack)
--	Evasion +5
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HPP,3);
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_VIT,1);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,27);
	effect:addMod(MOD_FOOD_ATT_CAP,30);
	effect:addMod(MOD_FOOD_RATTP,27);
	effect:addMod(MOD_FOOD_RATT_CAP,30);
	effect:addMod(MOD_EVA,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
