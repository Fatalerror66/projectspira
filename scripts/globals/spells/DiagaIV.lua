--------------------------------------
--	Author: Tenjou
-- 	Diaga IV
-- 	Lowers enemies' defense and gradually deals light elemental damage.
--
--	Extrapolated from other Diaga spells.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate initial damage.
	final = math.floor(20*getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100);
	
	--Calculate duration.
	duration = 60;
	
	--Check for Bio.
	bio = target:getStatusEffect(EFFECT_BIO);
	
	--Do it!
	if (bio == nil or (DIA_OVERWRITE == 0 and bio:getPower() <= 4) or (DIA_OVERWRITE == 1 and bio:getPower() < 4)) then
		target:addStatusEffect(EFFECT_DIA,4,3,duration,FLAG_ERASABLE);
	end
	final = takeMagicalDamage(caster,target,final);
	spell:setMsg(2);
	
	--Try to kill same tier Bio (optional)
	if (BIO_OVERWRITE == 1 and bio ~= nil) then
		if (bio:getPower() <= 4) then
			target:removeStatusType(EFFECT_BIO);
		end
	end
	
	--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(2);
	else
		spell:setMsg(264);
	end
	
	return final;
end;