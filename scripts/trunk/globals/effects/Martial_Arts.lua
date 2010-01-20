-----------------------------------
--	Author: Tenjou
--  Martial Arts
--	Increases speed of hand-to-hand attacks.
--
--	Based on job.  Reduces hand-to-hand delay by the specified amount.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	delay = 80; --Martial Arts I (main job)
	sdelay = 80; --Martial Arts I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 2) then --Monk
		if (lvl >= 75) then
			delay = 180; --Martial Arts VI
		elseif (lvl >= 61) then
			delay = 160; --Martial Arts V
		elseif (lvl >= 46) then
			delay = 140; --Martial Arts IV
		elseif (lvl >= 31) then
			delay = 120; --Martial Arts III
		elseif (lvl >= 16) then
			delay = 100; --Martial Arts II
		end
	elseif (job == 18) then --Puppetmaster
		if (lvl >= 75) then
			delay = 120; --Martial Arts III
		elseif (lvl >= 50) then
			delay = 100; --Martial Arts II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (job == 2) then --Monk
		if (slvl >= 31) then
			sdelay = 120; --Martial Arts III
		elseif (slvl >= 16) then
			sdelay = 100; --Martial Arts II
		end
	end
	
	--Only add the higher of the two.
	if (sdelay > delay) then
		delay = sdelay;
	end
	
	--Do it!
	effect:subtractMod(MOD_MARTIAL_ARTS,delay);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	delay = 80; --Martial Arts I (main job)
	sdelay = 80; --Martial Arts I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 2) then --Monk
		if (lvl >= 75) then
			delay = 180; --Martial Arts VI
		elseif (lvl >= 61) then
			delay = 160; --Martial Arts V
		elseif (lvl >= 46) then
			delay = 140; --Martial Arts IV
		elseif (lvl >= 31) then
			delay = 120; --Martial Arts III
		elseif (lvl >= 16) then
			delay = 100; --Martial Arts II
		end
	elseif (job == 18) then --Puppetmaster
		if (lvl >= 75) then
			delay = 120; --Martial Arts III
		elseif (lvl >= 50) then
			delay = 100; --Martial Arts II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (job == 2) then --Monk
		if (slvl >= 31) then
			sdelay = 120; --Martial Arts III
		elseif (slvl >= 16) then
			sdelay = 100; --Martial Arts II
		end
	end
	
	--Only add the higher of the two.
	if (sdelay > delay) then
		delay = sdelay;
	end
	
	--Do it!
	effect:addMod(MOD_MARTIAL_ARTS,delay);
end;]]--