-----------------------------------
--	Author: ReaperX
--  Stoneskin (effect)
--	Absorbs a certain amount of damage from physical and magical attacks.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	HP_ABSORBED = effect:getPower()
	effect:addMod(MOD_STONESKIN,HP_ABSORBED);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_STONESKIN,effect:getMod(MOD_STONESKIN)); -- does this need to be the original effect size ?
end;]]--