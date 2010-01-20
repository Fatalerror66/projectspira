-----------------------------------
--	Author: ReaperX
--  Resist Silence Trait
--  Gives you a slight resistance against Silence 
--
-- Resist Silence I: Obtained at Bard Level 5, Scholar Level 10
-- Resist Silence II: Obtained at Bard Level 25, Scholar Level 40
-- Resist Silence III: Obtained at Bard Level 45, Scholar Level 70
-- Resist Silence IV: Obtained at Bard Level 65

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	
	if (job == BRD) then
		lvl = target:getMainLvl();
	elseif (sjob == BRD) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 65) then
		resist1 = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 45) then
		resist1 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 25) then
		resist1 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 5) then
		resist1 = STATUS_RESIST_MULTIPLIER;
	else
		resist1 = 0;
	end
	
	if (job == SCH) then
		lvl = target:getMainLvl();
	elseif (sjob == SCH) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 70) then
		resist2 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 40) then
		resist2 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 10) then
		resist2 = STATUS_RESIST_MULTIPLIER;
	else
		resist2 = 0;
	end
	
	if (resist1 > resist2) then
		resist = resist1;
	else
		resist = resist2;
	end;
	
	effect:addMod(MOD_SILENCERES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
