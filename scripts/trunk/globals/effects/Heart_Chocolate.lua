-----------------------------------
--	Author: Psy aka psyclosis
--  Heart Chocolate
--
--	A heart-shaped chocolate.
--
--	http://wiki.ffxiclopedia.org/wiki/Heart_Chocolate
-- 
--  60 min, All Races
--  	
--  MP Recovered While Healing +4
----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
