-----------------------------------
--	Author: Psy aka psyclosis
--  Melon Pie +1
--	A shockingly good pie made from thundermelons.
--
--	http://wiki.ffxiclopedia.org/wiki/Melon_Pie_+1
-- 
-- 60 minutes, All Races
-- MP +30
-- Intelligence +5
-- MP Recovered while resting +2
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,30);
	effect:addMod(MOD_INT,5);
	effect:addMod(MOD_MPHEAL,2);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
