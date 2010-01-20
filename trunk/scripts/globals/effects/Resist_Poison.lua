-----------------------------------
--	Author: ReaperX
--  Resist Poison Trait
--  Increases resistance against poison. 
--
-- Resist Poison I: Obtained at Ranger Level 20 
-- Resist Poison II: Obtained at Ranger Level 40 
-- Resist Poison III: Obtained at Ranger Level 60 

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	if (job == RNG) then
		lvl = target:getMainLvl();
	elseif (sjob == RNG) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 60) then
		resist = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 40) then
		resist = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 20) then
		resist = STATUS_RESIST_MULTIPLIER;
	else
		resist = 0;
	end
	
	effect:addMod(MOD_POISONRES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
