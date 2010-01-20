-----------------------------------
--	Author: Almendro
--  Haste
--	Haste is a beneficial status effect that increases a character's speed.
--  Benefiting characters experience reduced weapon delay and magic recast timers. 
--  http://wiki.ffxiclopedia.org/wiki/Haste_%28Status_Effect%29
-----------------------------------
-- Include
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
-----------------------------------
function OnGainEffect(target,effect)
	effect:addMod(MOD_HASTE,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_HASTE,effect:getPower());
end;]]--