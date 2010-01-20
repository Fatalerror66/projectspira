-----------------------------------
--	Author: Bababooey
-- 	Honeyed Egg
-- 	An incredibly simple beverage made by mixing raw egg with honey.
--
--	http://wiki.ffxiclopedia.org/wiki/Honeyed_Egg
--	
--	30 Minutes, All Races
--	MP +8
--	Intelligence +1
--	MP Recovered while healing +1
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,8);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
