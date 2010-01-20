-----------------------------------
--	Author: ReaperX
--	Voidstorm (effect)
--	Gives the weather effect "Gloom" or upgrades it to "Darkness" if Gloom is already present.
--
--	If Stormsurge is active, enhances all target's attributes.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,effect:getPower());
	effect:addMod(MOD_INT,effect:getPower());
  effect:addMod(MOD_AGI,effect:getPower());
  effect:addMod(MOD_VIT,effect:getPower());
  effect:addMod(MOD_DEX,effect:getPower());
  effect:addMod(MOD_MND,effect:getPower());
	effect:addMod(MOD_CHR,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_STR,effect:getPower());
	effect:subtractMod(MOD_INT,effect:getPower());
  effect:subtractMod(MOD_AGI,effect:getPower());
  effect:subtractMod(MOD_VIT,effect:getPower());
  effect:subtractMod(MOD_DEX,effect:getPower());
  effect:subtractMod(MOD_MND,effect:getPower());
	effect:subtractMod(MOD_CHR,effect:getPower());
end;]]--