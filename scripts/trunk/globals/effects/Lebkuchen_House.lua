----------------------------------
--	Author: Psy aka psyclosis
--  Lebkuchen house
--
--	A house-shaped cake traditionally
--  baked by Selbina residents for the
--  Starlight Celebration. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Lebkuchen_House
--  3 hours, All Races
--  MP +10% (Cap: 45@450 Base MP)
--  Intelligence +3
----------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,10);
	effect:addMod(MOD_FOOD_MP_CAP,45);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
