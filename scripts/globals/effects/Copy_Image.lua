-----------------------------------
--	Author: Tenjou
--  Copy Image
--	A copy image lures attacks away from the target.
--
--	Used when target casts Utsusemi.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	shadows = 3;
	
	if (target:getMainJob() == 13) then
		if (effect:getPower() == 2) then
			shadows = 4;
		elseif (effect:getPower() == 3) then
			shadows = 5; --Logical progression.
		end
	end
	
	effect:addMod(MOD_UTSUSEMI,shadows);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	--This effect usually ends when the target has 0 shadows left, but sometimes when the target has left the shadows on for too long.
	effect:subtractMod(MOD_UTSUSEMI,effect:getMod(MOD_UTSUSEMI));
end;]]--