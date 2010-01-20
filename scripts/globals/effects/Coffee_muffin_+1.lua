-----------------------------------
--	Author: Psy aka psyclosis
--  Coffeecake muffin +1
--	An exceptionally aromatic coffee muffin. 
--
--	http://wiki.ffxiclopedia.org/wiki/Coffee_Muffin_%2B1
-- 
-- 60 min, All Races
-- MP  +10% (Cap 90@900 base MP)
-- Strength -1
-- Mind +2
----------------------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,90);
	effect:addMod(MOD_MND,2);
	effect:subtractMod(MOD_STR,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
