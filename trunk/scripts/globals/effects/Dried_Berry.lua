-----------------------------------
--	Author: Psy aka psyclosis
--  Dried Berry
--	A sweet rolanberry, dried in the sun. 
--	http://wiki.ffxiclopedia.org/wiki/Cupid_Chocolate
-- 
-- 3 min, All Races
-- INT +1
-- AGI -1
---------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,1);
	effect:subtractMod(MOD_AGI,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
