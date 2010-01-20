-----------------------------------
--	Author: ReaperX
--  Resist Paralyze Trait
--  Increases resistance against paralyze
--
-- Resist Paralyze I: Obtained at Corsair Level 5, Dark Knight Level 20
-- Resist Paralyze II: Obtained at Corsair Level 25, Dark Knight Level 40
-- Resist Paralyze III: Obtained at Corsair Level 45, Dark Knight Level 60
-- Resist Paralyze IV: Obtained at Corsair Level 65, Dark Knight Level 75

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	if (job == COR) then
		lvl = target:getMainLvl();
	elseif (sjob == COR) then
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
	
	if (job == DRK) then
		lvl = target:getMainLvl();
	elseif (sjob == DRK) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 75) then
		resist2 = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 60) then	
		resist2 = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 40) then
		resist2 = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 20) then
		resist2 = STATUS_RESIST_MULTIPLIER;
	else
		resist2 = 0;
	end
	
	if (resist1 > resist2) then
		resist = resist1;
	else
		resist = resist2;
	end;
	
	effect:addMod(MOD_PARALYZERES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
