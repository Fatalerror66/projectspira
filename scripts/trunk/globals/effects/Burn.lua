-----------------------------------
--	Author: ReaperX
--	Burn (effect)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_INT, -getElementalDebuffStatDownFromDOT(effect:getPower()));
end;

function OnTick(target,effect)
	target:removeHP(effect:getPower());
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_INT, getElementalDebuffStatDownFromDOT(effect:getPower()));
end;]]--