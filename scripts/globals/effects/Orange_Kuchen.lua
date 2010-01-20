-----------------------------------
--	Author: Psy aka psyclosis
--  Orange kuchen
--
--	A cake made with Saruta oranges 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Orange_Kuchen
--  3 hrs, All Races
--  MP +13% (Cap: 75@576 Base MP)
-------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,13);
	effect:addMod(MOD_FOOD_MP_CAP,75);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
