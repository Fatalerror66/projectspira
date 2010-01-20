-----------------------------------
--	Author: Bababooey
-- 	Boiler Crab
-- 	Boiled meat of the land crab. 
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Crab
--	
--
--	30 Minutes, All Races
--	Vitality +2
--	Defense +27% (Cap: 50@185 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_FOOD_DEFP,27);
	effect:addMod(MOD_FOOD_DEF_CAP,50);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
