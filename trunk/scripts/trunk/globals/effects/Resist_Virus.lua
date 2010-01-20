-----------------------------------
--	Author: ReaperX
--  Resist Virus Trait
--  Increases resistance against viruses. 
--
-- Resist Virus I: Obtained at Warrior Level 15 
-- Resist Virus II: Obtained at Warrior Level 35
-- Resist Virus III: Obtained at Warrior Level 55
-- Resist Virus IV: Obtained at Warrior Level 70

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	if (job == WAR) then
		lvl = target:getMainLvl();
	elseif (sjob == WAR) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 70) then
		resist = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 55) then
		resist = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 35) then
		resist = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 15) then
		resist = STATUS_RESIST_MULTIPLIER;
	else
		resist = 0;
	end
	
	effect:addMod(MOD_VIRUSRES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
