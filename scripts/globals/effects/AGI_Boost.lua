-----------------------------------
--	Author: ReaperX
--	AGI Boost (effect)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI, effect:getPower());
end;

function OnTick(target,effect)
	current_effect_size = effect:getPower();
	if (current_effect_size > 0) then
	  effect:setPower(current_effect_size-1)
	  effect:addMod(MOD_AGI,-1); -- the effect loses AGIength of 1 every 3 ticks depending on the source of the agui boost
  end;
end;

function OnLoseEffect(target,effect)
end;