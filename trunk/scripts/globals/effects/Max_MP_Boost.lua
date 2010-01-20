-----------------------------------
--	Author: ReaperX
--  Max MP Boost
--  Increases maximum Magic Points. 
--
-- Max MP Boost I : Obtained by SMN Level 10, SCH Level 30
-- Max MP Boost II : Obtained by SMN Level 30
-- Max MP Boost III : Obtained by SMN Level 50
-- Max MP Boost IV : Obtained by SMN Level 70

-- Each level of this trait adds 10 Max MP.
-- BLU is not covered since the trait is only obtained when certain spells are set.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");

function OnGainEffect(target,effect)
	job = target:getMainJob();
	sjob = target:getSubJob();
	
	if (job == SMN) then
		lvl = target:getMainLvl();
	elseif (sjob == SMN) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 70) then
		mp1 = 40;
	elseif (lvl >= 50) then
		mp1 = 30;
	elseif (lvl >= 30) then
		mp1 = 20;
	elseif (lvl >= 10) then
		mp1 = 10;
	else
		mp1 = 0;
	end
	
	if (job == SCH) then
		lvl = target:getMainLvl();
	elseif (sjob == SCH) then
		lvl = target:getSubLvl();
	else
		lvl = 0;
	end;	
	
	if (lvl >= 30) then
		mp2 = 10;
	else
		mp2 = 0;
	end
	
	if (mp1 > mp2) then
		mp = mp1;
	else
		mp = mp2;
	end;
	
	--effect:addMod(EFFECT_MAX_MP_UP,mp);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
