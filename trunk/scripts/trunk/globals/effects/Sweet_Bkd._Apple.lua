-----------------------------------
--	Author: Psy aka psyclosis
--  Sweet Baked Apple
--	A sweetened and baked apple.
--
--	http://wiki.ffxiclopedia.org/wiki/Sweet_Baked_Apple
-- 
-- 60 minutes, All Races
-- MP +25	
-- MP Recovered While Healing +2
-- Intelligence +4
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_MP,25);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_INT,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
