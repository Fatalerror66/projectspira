-----------------------------------
--	Author: Psy aka psyclosis
--  Dish of crimson jelly
--	The detoxified gelatinous remains of a
--  clot, whipped up into a tasty dessert. 
--
--	http://wiki.ffxiclopedia.org/wiki/Crimson_Jelly
-- 
--  3 Hours, All Races
--  MP +12%(Cap: 85@708 Base MP)
--  Intelligence +6
--  MP Recovered while healing +2
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,12);
	effect:addMod(MOD_FOOD_MP_CAP,85);
	effect:addMod(MOD_INT,6);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
