-----------------------------------
--	Author: Psy aka psyclosis
--  cinna-cookie
--	This cookie is seasoned with cinnamon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Cinna-cookie
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +4
-- Vermin Killer
-----------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,4);
	effect:addMod(MOD_VERMIN_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
