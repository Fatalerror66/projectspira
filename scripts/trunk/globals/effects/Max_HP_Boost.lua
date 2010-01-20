-----------------------------------
--	Author: Tenjou
--	Max HP Boost
--	Increases Max HP.
--
--	Based on level (Monk only).
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	lvl = target:getMainLvl();
	hp = 30; --Max HP Boost I
	
	--Check what the bonus would be for the main job.
	if (lvl >= 55) then
		hp = 60; --Max HP Boost II
	end

	--Do it!
	effect:addMod(MOD_HP,hp);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	lvl = target:getMainLvl();
	hp = 30; --Max HP Boost I
	
	--Check what the bonus would be for the main job.
	if (lvl >= 55) then
		hp = 60; --Max HP Boost II
	end
	
	--Do it!
	effect:subtractMod(MOD_HP,hp);
end;]]--