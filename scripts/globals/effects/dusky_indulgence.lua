-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of dusky indulgence
--
--  Made by a master patissier,
--  this gleaming black pudding
--  simply begs for a taste.
-- 
--  http://wiki.ffxiclopedia.org/wiki/Dusky_Indulgence
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +2
--  HP Recovered while healing +2
--  MP +5% (cap:30@600 Base MP)
--  HP +10
--  INT +4
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,5);
	effect:addMod(MOD_FOOD_MP_CAP,30);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_INT,5);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
