-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of black pudding
--
--  A Windurstian dessert made for
--  the Starlight Celebration.
--  Symbolizes a legendary monster
--  feared by the Mithra. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Black_Pudding
--
--  3 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  MP +4% (cap:25@625 Base MP)
--  HP +8
--  INT +4
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,4);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_FOOD_MP_CAP,25);
	effect:addMod(MOD_INT,4);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
