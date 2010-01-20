-----------------------------------
--	Author: Tenjou
--  Attack Bonus
--	Improves power of physical attacks.
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	att = 10; --Attack Bonus I (main job)
	satt = 10; --Attack Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 8) then --Dark Knight
		if (lvl >= 70) then
			att = 48; --Attack Bonus IV
		elseif (lvl >= 50) then
			att = 35; --Attack Bonus III
		elseif (lvl >= 30) then
			att = 22; --Attack Bonus II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 8 and slvl >= 30) then --Dark Knight
		satt = 22;
	end
	
	--Only add the higher of the two.
	if (satt > att) then
		att = satt;
	end
	
	--Do it!
	effect:addMod(MOD_ATT,att);
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
	att = 10; --Attack Bonus I (main job)
	satt = 10; --Attack Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 8) then --Dark Knight
		if (lvl >= 70) then
			att = 48; --Attack Bonus IV
		elseif (lvl >= 50) then
			att = 35; --Attack Bonus III
		elseif (lvl >= 30) then
			att = 22; --Attack Bonus II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 8 and slvl >= 30) then --Dark Knight
		satt = 22;
	end
	
	--Only add the higher of the two.
	if (satt > att) then
		att = satt;
	end
	
	--Do it!
	effect:subtractMod(MOD_ATT,att);
end;]]--