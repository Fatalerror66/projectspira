-----------------------------------
--	Author: Tenjou
--  Hundred Fists (effect)
--	Speeds up attacks.
--
--	Actually adds 74% haste.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HASTE,74);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_HASTE,74);
end;]]--