-----------------------------------
--	Author: Bababooey
-- 	Boiler Crayfish
-- 	A crayfish boiled in a salty broth.
--
--	http://wiki.ffxiclopedia.org/wiki/Boiled_Crayfish
--	
--
--	30 Minutes, All Races
--	Defense +30% (Cap: 25@83 Base Defense)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_DEFP,30);
	effect:addMod(MOD_FOOD_DEF_CAP,25);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
