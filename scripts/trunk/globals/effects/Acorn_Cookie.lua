-----------------------------------
--	Author: Psy aka psyclosis
--  Acorn Cookie
--	A cookie made with roasted acorns
--
--	http://wiki.ffxiclopedia.org/wiki/Acorn_Cookie
-- 
-- 3 minutes, All Races
-- MP Recovered while healing +3
-- Aquan Killer
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,3);
	effect:addMod(MOD_AQUAN_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
