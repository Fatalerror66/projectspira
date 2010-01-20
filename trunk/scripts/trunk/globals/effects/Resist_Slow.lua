-----------------------------------
--	Author: ReaperX
--  Resist Slow Trait
--  Increases resistance against slow. 
--
-- Resist Slow I: Obtained at Puppetmaster Level 10, Beastmaster Level 15, Dancer Level 20, Summoner Level 20
-- Resist Slow II: Obtained at Puppetmaster Level 50, Beastmaster Level 35, Summoner Level 40
-- Resist Slow III: Obtained at Puppetmaster Level 70, Beastmaster Level 55, Summoner Level 55
-- Resist Slow IV: Obtained at Beastmaster Level 75, Summoner Level 75

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	
	if (job == PUP) then
		lvl = target:getMainLvl();
	elseif (sjob == PUP) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 70) then
		resist1 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 50) then
		resist1 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 10) then
		resist1 = STATUS_RESIST_MULTIPLIER;
	else
		resist1 = 0;
	end
	
	if (job == BST) then
		lvl = target:getMainLvl();
	elseif (sjob == BST) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 75) then
		resist2 = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 55) then
		resist2 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 35) then
		resist2 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 15) then
		resist2 = STATUS_RESIST_MULTIPLIER;
	else
		resist2 = 0;
	end
	
	if (job == DNC) then
		lvl = target:getMainLvl();
	elseif (sjob == DNC) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 20) then
		resist3 = STATUS_RESIST_MULTIPLIER;
	else
		resist3 = 0;
	end

	if (job == SMN) then
		lvl = target:getMainLvl();
	elseif (sjob == SMN) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 75) then
		resist4 = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 55) then
		resist4 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 40) then
		resist4 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 20) then
		resist4 = STATUS_RESIST_MULTIPLIER;
	else
		resist4 = 0;
	end
	
	resist = 0;
	
	if (resist1 > resist) then
		resist = resist1;
	end;
	if (resist2 > resist) then
		resist = resist2;
	end;
	if (resist3 > resist) then
		resist = resist3;
	end;
	if (resist4 > resist) then
		resist = resist4;
	end;
	
	effect:addMod(MOD_SLOWRES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
