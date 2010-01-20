-----------------------------------
--	Author: Psy aka psyclosis
--  Rolanberry Pie 
--	A tart pie made from rolanberries.
--
--	http://wiki.ffxiclopedia.org/wiki/Rolanberry_Pie
-- 
-- 30 minutes, All Races
-- MP +50
-- Intelligence +2
-- Agility -1
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,50);
	effect:addMod(MOD_INT,2);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
