-----------------------------------
--	Author: ReaperX
--  Afflatus Solace
--  Inspires you to draw strength from the healing spells you cast. 
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
  effect:addMod(MOD_AFFLATUS_SOLACE_POOL,0);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_AFFLATUS_SOLACE_POOL,0);
end;]]--