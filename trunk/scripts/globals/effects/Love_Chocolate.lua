-----------------------------------
--	Author: Psy aka psyclosis
--  Love Chocolate
--
--	This heart-shaped chocolate
--  has been wrapped with ribbon
--  and parchment. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Love_Chocolate
--  3 hrs, All Races
--  MP Recovered while healing +4
-------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
