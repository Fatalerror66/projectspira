----------------------------------
--	Author: Psy aka psyclosis
--  Lebkuchen manse
--
--	A remarkably detailed lebkuchen house,
--  and quite delicious, too. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Lebkuchen_Manse
--  4 hours, All Races
--  MP +15% (Cap: 55@550 Base MP) info non complete on wiki
--  Intelligence +4
--  HP Recovered while healing +3
--  MP Recovered while healing +2 
----------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,15);
	effect:addMod(MOD_FOOD_MP_CAP,55);
	effect:addMod(MOD_INT,4);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HPHEAL,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
