--------------------------------------
--	Author: Tenjou
-- 	Bio
-- 	Deals dark damage that weakens an enemy's attacks and gruadually reduces its HP.
--
--	http://wiki.ffxiclopedia.org/wiki/Bio
--	Actually lowers defense by 27/512.
--
--	Needs more detailed calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate initial damage.
	basedmg = caster:getSkill(DARK_MAGIC_SKILL)/4;
	final = math.floor(basedmg*getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100);
	
	--Calculate duration.
	duration = 120;
	
	--Check for Dia.
	dia = target:getStatusEffect(EFFECT_DIA);

	--Calculate DoT (rough, though fairly accurate)
	dotdmg = 2+math.floor(caster:getSkill(DARK_MAGIC_SKILL)/60);
	
	--Do it!
	if (BIO_OVERWRITE == 0 or (BIO_OVERWRITE == 1 and dia == nil)) then
		target:addStatusEffect(EFFECT_BIO,1,3,duration,FLAG_ERASABLE);
	end
	target:removeHP(final);
	target:updateEnmity(caster,1,320);
	spell:setMsg(2);
	
	--Try to kill same tier Dia (default behavior)
	if (DIA_OVERWRITE == 1 and dia ~= nil) then
		if (dia:getPower() == 1) then
			target:removeStatusType(EFFECT_DIA);
		end
	end
	
	return final;
end;