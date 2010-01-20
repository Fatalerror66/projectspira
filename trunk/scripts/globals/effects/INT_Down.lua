-----------------------------------
--	Author: ReaperX
--	INT Down (effect)
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,-effect:getPower());
end;

function OnTick(target,effect)
	current_effect_size = effect:getPower()
	if (current_effect_size > 0) then
	  effect:setPower(current_effect_size-1)
	  effect:addMod(MOD_INT,1); -- the effect loses INTength of 1 every 3 ticks.
  end;
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_INT, effect:getPower()); 
end;]]--