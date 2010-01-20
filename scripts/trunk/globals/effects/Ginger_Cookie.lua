-----------------------------------
--	Author: Psy aka psyclosis
--  ginger cookie
--	Ginger is used to flavor this cookie.  
--
--	http://wiki.ffxiclopedia.org/wiki/Ginger_Cookie
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +5
-- Plantoid Killer
-- Resist Slow
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,5);
	effect:addMod(MOD_PLANTOID_KILLER,5);
	effect:addMod(MOD_SLOWRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
