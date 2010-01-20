-----------------------------------
--	Author: ReaperX
--  Phalanx (effect)
--	Gives you a certain amount of damage resistance.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
  effect:addMod(MOD_PHALANX,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_PHALANX,effect:getPower());
end;]]--