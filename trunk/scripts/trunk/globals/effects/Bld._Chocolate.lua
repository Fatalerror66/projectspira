-----------------------------------
--	Author: Psy aka psyclosis
--  Bloody Chocolate
--	Sweet, bitter, and spicy all at once,
--  this blood-red bite-sized chocolate
--  melts in your mouth as well as your
--  hands. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bloody_Chocolate
-- 
-- 60 minutes, All Races
-- MP Recovered while healing +4
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
