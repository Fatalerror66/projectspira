-----------------------------------
--	Author: Psy aka psyclosis
--  Cherry muffin +1
--	An exceptionally delicious cherry
--  muffin. All the Yagudo cherries inside
--  are equidistant from each other.
--
--	http://wiki.ffxiclopedia.org/wiki/Cherry_Muffin_%2B1
-- 
-- 60 min, All Races
-- MP  +10% (Cap 85@850 base MP)
-- Intelligence +2
-- Agility -1
----------------------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,85);
	effect:addMod(MOD_INT,2);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
