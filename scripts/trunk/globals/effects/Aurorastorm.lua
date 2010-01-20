-----------------------------------
--	Author: ReaperX
--	Aurorastorm (effect)
--	Gives the weather effect "Auroras" or upgrades them to "Stellar Glare" if Auroras are already present.
--
--	If Stormsurge is active, enhances target's CHR.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_CHR,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_CHR,effect:getPower());
end;]]--