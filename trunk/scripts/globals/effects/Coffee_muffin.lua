-----------------------------------
--	Author: Psy aka psyclosis
--  Coffeecake muffin 
--	A tiny cake flavored with coffee.  
--
--	http://wiki.ffxiclopedia.org/wiki/Coffee_Muffin
-- 
-- 30 min, All Races
-- MP  +10% (Cap 85@850 base MP)
-- Strength -1
-- Mind +1
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,85);
	effect:addMod(MOD_MND,1);
	effect:subtractMod(MOD_STR,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
