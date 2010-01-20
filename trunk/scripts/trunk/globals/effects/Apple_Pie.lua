-----------------------------------
--	Author: Psy aka psyclosis
--  Apple pie 
--	A sweet pie made from faerie apples.
--
--	http://wiki.ffxiclopedia.org/wiki/Apple_Pie
-- 
-- 30 minutes, All Races
-- MP +25
-- Intelligence +3
-- Agility -1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,25);
	effect:addMod(MOD_INT,3);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
