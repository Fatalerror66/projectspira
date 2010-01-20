-----------------------------------
--	Author: Psy aka psyclosis
--  Wild Cookie 
--	A deliciously baked acorn cookie. 
--
--	http://wiki.ffxiclopedia.org/wiki/Wild_Cookie
-- 
-- 5 minutes, All Races
-- MP Recovered while healing +5
-- Aquan Killer
-- Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,5);
	effect:addMod(MOD_AQUAN_KILLER,5);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
