-----------------------------------
--	Author: Psy aka psyclosis
--  Gateau aux fraises
--
--	A Bastokan cake made for
--  the Starlight Celebration.
--  Symbolizes the fire of civilization,
--  come to melt away the snow.     
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Gateau_aux_Fraises
--
--  3 hours, All Races
--  Group Effects
--  MP Recovered while healing +1
--  MP +8% (cap:50@625 Base MP)
--  HP +8
--  INT +1
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,8);
	effect:addMod(MOD_FOOD_MP_CAP,50);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
