-----------------------------------
--	Author: Psy aka psyclosis
--  Rolsin
--	Only the sweetest dried rolanberries can be deemed "rolsins." 
--	http://wiki.ffxiclopedia.org/wiki/Rolsin
-- 
-- 5 min, All Races
-- INT +1
-- AGI -3
---------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,1);
	effect:subtractMod(MOD_AGI,3);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
