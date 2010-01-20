-----------------------------------
--	Author: ReaperX
--  Resist Petrify Trait
--  Increases resistance against petrify. 
--
-- Resist Petrify I: Obtained at Red Mage Level 10 
-- Resist Petrify II: Obtained at Red Mage Level 30 
-- Resist Petrify III: Obtained at Red Mage Level 50 
-- Resist Petrify IV: Obtained at Red Mage Level 71 

-- I know of no testing that quantifies this trait so I'm assuming
-- linear progression with a variable multiplier.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	if (job == RDM) then
		lvl = target:getMainLvl();
	elseif (sjob == RDM) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 71) then
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
	
	effect:addMod(MOD_PETRIFYRES,resist);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
