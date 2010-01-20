-----------------------------------
--	Author: Tenjou
--  Fast Cast
--	Quickens spellcasting.
--
--	Based on level (Red Mage only).
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	rdm = (target:getMainJob() == 5 or target:getSubJob() == 5);
	fastcast = 10; --Fast Cast I
	
	if (rdm) then
		if (lvl >= 55) then
			fastcast = 20;
		elseif (lvl >= 35 or slvl >= 35) then
			fastcast = 15;
		end
	end
	
	--Do it!
	effect:addMod(MOD_FASTCAST,fastcast);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	rdm = (target:getMainJob() == 5 or target:getSubJob() == 5);
	fastcast = 10; --Fast Cast I
	
	if (rdm) then
		if (lvl >= 55) then
			fastcast = 20;
		elseif (lvl >= 35 or slvl >= 35) then
			fastcast = 15;
		end
	end
	
	--Do it!
	effect:subtractMod(MOD_FASTCAST,fastcast);
end;]]--