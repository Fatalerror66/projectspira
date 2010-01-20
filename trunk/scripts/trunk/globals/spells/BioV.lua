--------------------------------------
--	Author: Tenjou
-- 	Bio V
-- 	Deals dark damage that weakens an enemy's attacks and gruadually reduces its HP.
--
--	Completely made up. Kegsay: Also made up. 
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate initial damage.
	basedmg = caster:getSkill(DARK_MAGIC_SKILL)*2;
	final = math.floor(basedmg*getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100);
	
	--Calculate duration.
	duration = 45;
	
	--Calculate DoT (extrapolated)
	dotdmg = 6+math.floor(caster:getSkill(DARK_MAGIC_SKILL)/60);

	--Check for Dia.
	dia = target:getStatusEffect(EFFECT_DIA);
	
	--Do it!
	if (dia == nil or (BIO_OVERWRITE == 0 and dia:getPower() <= 5) or (BIO_OVERWRITE == 1 and dia:getPower() < 5)) then
		target:addStatusEffect(EFFECT_BIO,dotdmg,3,duration,FLAG_ERASABLE);
	end
	target:removeHP(final);
	target:updateEnmity(caster,1,320);
	spell:setMsg(2);
	
	--Try to kill same tier Dia (default behavior)
	if (DIA_OVERWRITE == 1 and dia ~= nil) then
		if (dia:getPower() <= 5) then
			target:removeStatusType(EFFECT_DIA);
		end
	end
	
	return final;
end;