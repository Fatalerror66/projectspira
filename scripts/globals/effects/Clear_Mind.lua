-----------------------------------
--	Author: Tenjou
--  Clear Mind
--	Increases the amount of MP recovered while resting. 
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	lvl = target:getMainLvl();
	slvl = target:getSubLvl();
	mpheal = 3; --Clear Mind I (main job)
	smpheal = 0;
	sdef = 3; --Clear Mind I (sub job)
	clearmind = 0; --Amount healed between tics (main job only)
	
	--Check what the bonus would be for the main job.
	if (job == 15) then --Summoner
		if (lvl >= 70) then
			mpheal = 15; --Clear Mind V
			clearmind = 2;
		elseif (lvl >= 60) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 45) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 30) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 4) then --Black Mage
		if (lvl >= 75) then
			mpheal = 15; --Clear Mind V
			clearmind = 2;
		elseif (lvl >= 60) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 45) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 30) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 3 or job == 20) then --White Mage or Scholar
		if (lvl >= 65) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 50) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 35) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 5) then --Red Mage
		if (lvl >= 75) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 53) then
			mpheal = 6; --Clear Mind II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 4 or sjob == 15) then --Black Mage or Summoner
		if (slvl >= 30) then
			smpheal = 6; --Clear Mind II
		end
	elseif (sjob == 3 or sjob == 20) then --White Mage or Scholar
		if (slvl >= 35) then
			smpheal = 6; --Clear Mind II
		end
	end
	
	--Only add the higher of the two.
	if (smpheal > mpheal) then
		mpheal = smpheal;
	end
	
	--Do it!
	effect:addMod(MOD_MPHEAL,mpheal);
	effect:addMod(MOD_CLEAR_MIND,clearmind);
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
	mpheal = 3; --Clear Mind I (main job)
	sdef = 3; --Clear Mind I (sub job)
	clearmind = 0; --Amount healed between tics (main job only)
	
	--Check what the bonus would be for the main job.
	if (job == 15) then --Summoner
		if (lvl >= 70) then
			mpheal = 15; --Clear Mind V
			clearmind = 2;
		elseif (lvl >= 60) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 45) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 30) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 4) then --Black Mage
		if (lvl >= 75) then
			mpheal = 15; --Clear Mind V
			clearmind = 2;
		elseif (lvl >= 60) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 45) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 30) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 3 or job == 20) then --White Mage or Scholar
		if (lvl >= 65) then
			mpheal = 12; --Clear Mind IV
			clearmind = 1;
		elseif (lvl >= 50) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 35) then
			mpheal = 6; --Clear Mind II
		end
	elseif (job == 5) then --Red Mage
		if (lvl >= 75) then
			mpheal = 9; --Clear Mind III
			clearmind = 1;
		elseif (lvl >= 53) then
			mpheal = 6; --Clear Mind II
		end
	end
	
	--Check what the bonus would be for the sub job.
	if (sjob == 4 or sjob == 15) then --Black Mage or Summoner
		if (slvl >= 30) then
			mpheal = 6; --Clear Mind II
		end
	elseif (sjob == 3 or sjob == 20) then --White Mage or Scholar
		if (slvl >= 35) then
			smpheal = 6; --Clear Mind II
		end
	end
	
	--Only add the higher of the two.
	if (smpheal > mpheal) then
		mpheal = smpheal;
	end
	
	--Do it!
	effect:subtractMod(MOD_MPHEAL,mpheal);
	effect:subtractMod(MOD_CLEAR_MIND,clearmind);
end;]]--