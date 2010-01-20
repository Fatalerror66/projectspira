-----------------------------------
--	Author: Bababooey
-- 	Cilbir
-- 	A delightful dish of poached eggs covered in yogurt and butter. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cilbir
--	
-- 	UNCONFIRMED
--	3 hours, All Races
--	HP +5%
--	MP +3%
-- 	HP Recovered while healing +3
--	MP Recovered while healing +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_HPP,5);
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_HPHEAL,3);
	effect:addMod(MOD_MPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
