-----------------------------------
--	Author: Psy aka psyclosis
--  Coin cookie
--	One of the best cinnamon cookies you'll ever eat.  
--
--	http://wiki.ffxiclopedia.org/wiki/Coin_Cookie
-- 
-- 5 minutes, All Races
-- MP Recovered while healing +6
-- Vernmin Killer
----------------------------------------

 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,6);
	effect:addMod(MOD_VERMIN_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
