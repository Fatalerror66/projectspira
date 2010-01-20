-----------------------------------
--	Author: Psy aka psyclosis
--  Serving of vermillion jelly
-- 
--	This is about as tasty as you can
--  make the detoxified gelatinous remains
--  of a clot.  
--
--	http://wiki.ffxiclopedia.org/wiki/Vermillion_Jelly
-- 
--  4 Hours, All Races
--  MP +12%(Cap: 90@750 Base MP)
--  Intelligence +6
--  MP Recovered while healing +2
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,12);
	effect:addMod(MOD_FOOD_MP_CAP,90);
	effect:addMod(MOD_INT,6);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
