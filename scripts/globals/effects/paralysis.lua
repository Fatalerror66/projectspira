-----------------------------------
--	Author: Kegsay
--  paralysis
--	Occasionally makes you lose all your charged items ; ;.
--
--	
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_PARALYZE,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;