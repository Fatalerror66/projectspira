-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Date +1
--	These dried dates are unbelievably sweet.  
--	http://wiki.ffxiclopedia.org/wiki/Dried_Date_%2B1
-- 
-- 60 min, All Races
-- INT +4
-- AGI -1
-- HP +12
-- MP +22
---------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,4);
	effect:subtractMod(MOD_AGI,1);
	effect:addMod(MOD_HP,12);
	effect:addMod(MOD_MP,22);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
