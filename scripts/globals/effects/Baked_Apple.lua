-----------------------------------
--	Author: Psy aka psyclosis
--  Baked Apple
--	A sweetened and baked apple.
--
--	http://wiki.ffxiclopedia.org/wiki/Baked_Apple
-- 
-- 30 minutes, All Races
-- MP +20	
-- Agility -1
-- Intelligence +3
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,20);
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_INT,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
