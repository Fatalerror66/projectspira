-----------------------------------
--	Author: Tenjou
--  Defense Bonus
--	Improves defense against physical attacks. 
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	def = 10; --Defense Bonus I (main job)
	sdef = 10; --Defense Bonus I (sub job)
	
	--Check what the bonus would be for the main job.
	if (job == 7) then --Paladin
		if (lvl >= 70) then
			def = 48; --Defense Bonus IV
		elseif (lvl >= 50) then
			def = 35; --Defense Bonus III
		elseif (lvl >= 30) then
			def = 22; --Defense Bonus II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 7 and slvl >= 30) then --Paladin
		sdef = 22;
	end
	
	--Only add the higher of the two.
	if (sdef > def) then
		def = sdef;
	end
	
	--Do it!
	effect:addMod(MOD_DEF,def);
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
	def = 10; --Defense Bonus I (main job)
	sdef = 10; --Defense Bonus I (sub job)
	
	--Check what the bonus was for the main job.
	if (job == 7) then --Paladin
		if (lvl >= 70) then
			def = 48; --Defense Bonus IV
		elseif (lvl >= 50) then
			def = 35; --Defense Bonus III
		elseif (lvl >= 30) then
			def = 22; --Defense Bonus II
		end
	end
	
	--Check what the bonus was for the sub job.
	if (sjob == 7 and slvl >= 30) then --Paladin
		sdef = 22; --Defense Bonus II
	end
	
	--Only remove the higher of the two.
	if (sdef > def) then
		def = sdef;
	end
	
	--Do it!
	effect:subtractMod(MOD_DEF,def);
end;]]--