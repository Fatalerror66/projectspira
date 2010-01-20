-----------------------------------
--	Author: ReaperX
--  Enaero
--	Adds wind damage to your attacks. 
--  effect:getPower() is only the nominal base damage; weather and magic resist 
--  effects are not factored in since they are random and must be computed for 
--  each hit. Equipment enspell enhancement is also being ignored for now.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
  effect:addMod(MOD_ENAERO,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_ENAERO,effect:getPower());
end;]]--