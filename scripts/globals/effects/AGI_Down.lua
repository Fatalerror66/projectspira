-----------------------------------
--	Author: ReaperX
--	AGI Down (effect)
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,-effect:getPower());
end;

function OnTick(target,effect)
	current_effect_size = effect:getPower()
	if (current_effect_size > 0) then
	  effect:setPower(current_effect_size-1)
	  effect:addMod(MOD_AGI,1); -- the effect loses AGIength of 1 every 3 ticks.
  end;
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_AGI, effect:getPower()); 
end;]]--