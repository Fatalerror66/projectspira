-----------------------------------
--	Author: ReaperX
--  Resist Bind Trait
--  Increases resistance against bind. 
--
-- Resist Bind I: Obtained at Ninja Level 10
-- Resist Bind II: Obtained at Ninja Level 30
-- Resist Bind III: Obtained at Ninja Level 50
-- Resist Bind IV: Obtained at Ninja Level 70

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	if (job == NIN) then
		lvl = target:getMainLvl();
	elseif (sjob == NIN) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 70) then
		resist = 4*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 50) then
		resist = 3*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 30) then
		resist = 2*STATUS_RESIST_MULTIPLIER;
	elseif (lvl >= 10) then
		resist = STATUS_RESIST_MULTIPLIER;
	else
		resist = 0;
	end
	
	effect:addMod(MOD_BINDRES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
