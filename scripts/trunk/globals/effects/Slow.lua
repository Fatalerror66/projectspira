-----------------------------------
--	Author: Tenjou
--  Slow
--	Slow is a detrimental status effect that decreases a character's speed.
-----------------------------------
-- Include
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
-----------------------------------
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_HASTE,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_HASTE,effect:getPower());
end;]]--