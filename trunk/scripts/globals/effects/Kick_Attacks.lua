-----------------------------------
--	Author: Tenjou
--	Kick Attacks
--	Occasionally delivers kick attacks when using hand-to-hand weapons.
--
--	Based on level (Monk only).
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	lvl = target:getMainLvl();
	kick = 5; --Kick Attacks I
	
	--Check what the bonus would be for the main job.
	if (lvl >= 71) then
		kick = 10; --Kick Attacks II
	end

	--Do it!
	effect:addMod(MOD_KICK_ATTACK,kick);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	lvl = target:getMainLvl();
	kick = 5; --Kick Attacks I
	
	--Check what the bonus would be for the main job.
	if (lvl >= 71) then
		kick = 10; --Kick Attacks II
	end

	--Do it!
	effect:subtractMod(MOD_KICK_ATTACK,kick);
end;]]--