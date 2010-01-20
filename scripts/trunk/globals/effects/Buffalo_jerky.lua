-----------------------------------
--	Author: Bababooey
-- 	Buffalo Jerky
-- 	Dried buffalo meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Buffalo_Jerky
--	30 Minutes, All Races
--  Strength +4
--	Mind -2
--  Attack +18% (Cap: 65@361 Base Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,4);
	effect:subtractMod(MOD_MND,2);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,65);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
