-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Seraph's Kiss
--
--	Made by a master patissier,
--  one taste of this gleaming snoll gelato
--  will leave you craving more. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Seraph%27s_Kiss
--  60 min, All Races
--  MP +16% (Cap: 85@531 Base MP)
--  MP Recovered while healing +2
--  HP +15
--------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,16);
	effect:addMod(MOD_FOOD_MP_CAP,85);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,15);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
