-----------------------------------
--	Author: Tenjou
--  Magic Defense Bonus
--	Improves defense against magic spells. 
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	def = 10; --Magic Defense Bonus I (main job)
	sdef = 10; --Magic Defense Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 3) then --White Mage
		if (lvl >= 70) then
			def = 16; --Magic Defense Bonus IV
		elseif (lvl >= 50) then
			def = 14; --Magic Defense Bonus III
		elseif (lvl >= 30) then
			def = 12; --Magic Defense Bonus II
		end
	elseif (job == 5 and lvl >= 45) then --Red Mage
		def = 12;
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 3 and slvl >= 30) then --White Mage
		sdef = 12;
	end
	
	--Only add the higher of the two.
	if (sdef > def) then
		def = sdef;
	end
	
	--Do it!
	effect:addMod(MOD_MDEF,def);
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
	def = 10; --Magic Defense Bonus I (main job)
	sdef = 10; --Magic Defense Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 3) then --White Mage
		if (lvl >= 70) then
			def = 16; --Magic Defense Bonus IV
		elseif (lvl >= 50) then
			def = 14; --Magic Defense Bonus III
		elseif (lvl >= 30) then
			def = 12; --Magic Defense Bonus II
		end
	elseif (job == 5 and lvl >= 45) then --Red Mage
		def = 12;
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 3 and slvl >= 30) then --White Mage
		sdef = 12;
	end
	
	--Only add the higher of the two.
	if (sdef > def) then
		def = sdef;
	end
	
	--Do it!
	--effect:subtractMod(MOD_MDEF,def);
end;]]--