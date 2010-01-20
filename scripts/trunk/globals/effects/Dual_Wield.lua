-----------------------------------
--	Author: Tenjou
--  Dual Wield (Job Trait)
--	Allows you to equip two weapons.
--
--	Also sets the delay reduction.  Based on level (Ninja only).
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	nin = (target:getMainJob() == 13 or target:getSubJob() == 13);
	dualwield = 10; --Dual Wield I
	
	if (nin) then
		if (lvl >= 65) then
			dualwield = 30;
		elseif (lvl >= 45) then
			dualwield = 25;
		elseif (lvl >= 25 or slvl >= 25) then
			dualwield = 15;
		end
	end
	
	--Do it!
	effect:addMod(MOD_DUAL_WIELD,dualwield);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	nin = (target:getMainJob() == 13 or target:getSubJob() == 13);
	dualwield = 10; --Dual Wield I
	
	if (nin) then
		if (lvl >= 65) then
			dualwield = 30;
		elseif (lvl >= 45) then
			dualwield = 25;
		elseif (lvl >= 25 or slvl >= 25) then
			dualwield = 15;
		end
	end
	
	--Do it!
	effect:subtractMod(MOD_DUAL_WIELD,dualwield);
end;]]--