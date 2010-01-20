-----------------------------------
--	Author: ReaperX
--  Blink (effect)
--	Creates shadow images that each absorb a single attack directed at you.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
  effect:addMod(MOD_BLINK,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_BLINK,effect:getPower());
end;]]--