-----------------------------------
--	Author: Bababooey
-- 	Steamed Crayfish
-- 	One step above your average boiled crayfish.
--
--	http://wiki.ffxiclopedia.org/wiki/Steamed_Crayfish
--	
--
--	60 Minutes, All Races
--	Defense +30% (Cap: 30@100 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_DEFP,30);
	effect:addMod(MOD_FOOD_DEF_CAP,30);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
