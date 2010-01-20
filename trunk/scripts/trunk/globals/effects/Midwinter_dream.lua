-----------------------------------
--	Author: Psy aka psyclosis
--  Midwinter dream
--
--	A Bastokan cake made for
--  the Starlight Celebration.
--  Symbolizes the fire of civilization,
--  come to melt away the snow.     
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Midwinter_Dream
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  MP +9% (cap:60@666 Base MP)
--  HP +10
--  INT +2
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,9);
	effect:addMod(MOD_FOOD_MP_CAP,60);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
