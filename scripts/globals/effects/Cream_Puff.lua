-----------------------------------
--	Author: Psy aka psyclosis
--  Cream Puff
--	A popular dessert the world round, this treat is comprised of 
--  sweet, fluffy cream injected into a thin, crispy crust.
--
--	http://wiki.ffxiclopedia.org/wiki/Cream_Puff
-- 
-- 30 min, All Races
-- Intelligence +7
-- HP -10
-----------------------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_HP,10);
	effect:addMod(MOD_INT,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
