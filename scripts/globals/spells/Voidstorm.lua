--------------------------------------
--	Author: ReaperX
-- 	Voidstorm
--	Changes the weather around target party member to "gloomy."
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	
	duration = STORM_DURATION;
	
	if (target:getStatusEffect(EFFECT_FIRESTORM)~=nil) then
		target:removeStatusType(EFFECT_FIRESTORM);
	elseif (target:getStatusEffect(EFFECT_HAILSTORM)~=nil) then
		target:removeStatusType(EFFECT_HAILSTORM);
	elseif (target:getStatusEffect(EFFECT_WINDSTORM)~=nil) then
		target:removeStatusType(EFFECT_WINDSTORM);
	elseif (target:getStatusEffect(EFFECT_SANDSTORM)~=nil) then
		target:removeStatusType(EFFECT_SANDSTORM);
	elseif (target:getStatusEffect(EFFECT_THUNDERSTORM)~=nil) then
		target:removeStatusType(EFFECT_THUNDERSTORM);
	elseif (target:getStatusEffect(EFFECT_RAINSTORM)~=nil) then
		target:removeStatusType(EFFECT_RAINSTORM);
	elseif (target:getStatusEffect(EFFECT_AURORASTORM)~=nil) then
		target:removeStatusType(EFFECT_AURORASTORM);
	end

	-- missing : check for merit job trait Stormsurge. We're assuming here that Stormsurge is merited to level 5.
	
	StormsurgeLevel = 5;
	
	target:addStatusEffect(EFFECT_VOIDSTORM,math.floor(1+StormsurgeLevel/2),0,duration);
		--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
		
	target:updateEnmity(caster,300,1);
	final = EFFECT_VOIDSTORM;
	return final;
end;