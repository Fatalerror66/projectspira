-----------------------------------
--	Author: Psy aka psyclosis
--  Melon Pie
--	A shockingly good pie made from thundermelons.
--
--	http://wiki.ffxiclopedia.org/wiki/Melon_Pie
-- 
-- 30 minutes, All Races
-- MP +25
-- Intelligence +4
-- Agility -1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,25);
	effect:addMod(MOD_INT,4);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
