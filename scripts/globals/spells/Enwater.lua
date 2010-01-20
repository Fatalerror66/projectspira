--------------------------------------
--	Author: ReaperX
-- 	Enwater
--	Adds water damage to your attacks.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
			
	basedmg = getEnspellDmg(caster)
	  
	if (target:getStatusEffect(EFFECT_ENSTONE) ~= nil) then
	  target:removeStatusType(EFFECT_ENSTONE);
	elseif (target:getStatusEffect(EFFECT_ENFIRE) ~= nil) then
		target:removeStatusType(EFFECT_ENFIRE);
	elseif (target:getStatusEffect(EFFECT_ENWATER) ~= nil) then
		target:removeStatusType(EFFECT_ENWATER);
	elseif (target:getStatusEffect(EFFECT_ENBLIZZARD) ~= nil) then
		target:removeStatusType(EFFECT_ENBLIZZARD);
	elseif (target:getStatusEffect(EFFECT_ENAERO) ~= nil) then
		target:removeStatusType(EFFECT_ENAERO);
	elseif (target:getStatusEffect(EFFECT_ENTHUNDER) ~= nil) then
		target:removeStatusType(EFFECT_ENTHUNDER);
	end;
		
	target:addStatusEffect(EFFECT_ENWATER,basedmg,0,ENSPELL_DURATION,FLAG_DISPELABLE);
	--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
		
	target:updateEnmity(caster,300,1);
	final = EFFECT_ENWATER;
	return final;
end;