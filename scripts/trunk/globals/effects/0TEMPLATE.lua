-----------------------------------
--	Author: 
--  Name of Effect
--	Description, help text from in-game if possible.
--
--	Additional comments about formulas, what's still missing, etc.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_NONE,0);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[
end;]]--