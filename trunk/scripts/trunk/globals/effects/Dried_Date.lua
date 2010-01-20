-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Date
--	This date has become even sweeter after dehydration.  
--	http://wiki.ffxiclopedia.org/wiki/Dried_Date
-- 
-- 30min, All Races
-- INT +3
-- AGI -1
-- HP +10
-- MP +20
---------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,3);
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_MP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
