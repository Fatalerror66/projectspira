-----------------------------------
--	Author: ReaperX
--  Aquaveil (effect)
--	Reduces chance of having a spell interrupted.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_SPELLINT,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_SPELLINT,effect:getPower());
end;]]--