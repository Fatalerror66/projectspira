-----------------------------------
--	Author: Bababooey
-- 	Meatloaf
-- 	Finely seasoned meat formed into the shape of a loaf of bread and baked to
--	goodness. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meatloaf
--
--	180 Minutes, All Races
--	Strength +6
--  Agility +2
--	Intelligence -3
--  Attack +20% (Cap: 75@403 Base Attack)
--	Maybe other stat bonuses
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_ATTP,20)
	effect:addMod(MOD_FOOD_ATT_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
