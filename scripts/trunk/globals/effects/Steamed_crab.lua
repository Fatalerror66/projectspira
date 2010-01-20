-----------------------------------
--	Author: Bababooey
-- 	Steamed Crab
-- 	One step above your average boiled crab. 
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Crab
--	
--
--	60 Minutes, All Races
--	Vitality +3
--	Defense +27% (Cap: 55@203 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,3);
	effect:addMod(MOD_FOOD_DEFP,27);
	effect:addMod(MOD_FOOD_DEF_CAP,55);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
