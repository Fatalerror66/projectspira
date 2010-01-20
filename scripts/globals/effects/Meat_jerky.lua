-----------------------------------
--	Author: Bababooey
-- 	Meat Jerky
-- 	A snack made from dried mutton. 
--
--	http://wiki.ffxiclopedia.org/wiki/Meat_Jerky
--
--	30 Minutes, All Races
--	Strength +3
--	Intelligence -1
--  Attack +22% (Cap: 30@136 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,22)
	effect:addMod(MOD_FOOD_ATT_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
