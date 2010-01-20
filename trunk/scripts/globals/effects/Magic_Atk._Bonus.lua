-----------------------------------
--	Author: Tenjou
--  Magic Attack Bonus
--	Improves power against magic spells. 
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	att = 20; --Magic Attack Bonus I (main job)
	satt = 20; --Magic Attack Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 4) then --Black Mage
		if (lvl >= 70) then
			att = 32; --Magic Attack Bonus IV
		elseif (lvl >= 50) then
			att = 28; --Magic Attack Bonus III
		elseif (lvl >= 30) then
			att = 24; --Magic Attack Bonus II
		end
	elseif (job == 5 and lvl >= 40) then --Red Mage
		att = 24;
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 3 and slvl >= 30) then --Black Mage
		satt = 24;
	end
	
	--Only add the higher of the two.
	if (satt > att) then
		att = satt;
	end
	
	--Do it!
	effect:addMod(MOD_MATT,att);
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
	att = 20; --Magic Attack Bonus I (main job)
	satt = 20; --Magic Attack Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 4) then --Black Mage
		if (lvl >= 70) then
			att = 32; --Magic Attack Bonus IV
		elseif (lvl >= 50) then
			att = 28; --Magic Attack Bonus III
		elseif (lvl >= 30) then
			att = 24; --Magic Attack Bonus II
		end
	elseif (job == 5 and lvl >= 40) then --Red Mage
		att = 24;
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 3 and slvl >= 30) then --Black Mage
		satt = 24;
	end
	
	--Only add the higher of the two.
	if (satt > att) then
		att = satt;
	end
	
	--Do it!
	effect:subtractMod(MOD_MATT,att);
end;]]--