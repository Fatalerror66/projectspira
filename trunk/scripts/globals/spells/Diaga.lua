--------------------------------------
--	Author: Tenjou
-- 	Diaga
-- 	Lowers enemies' defense and gradually deals light elemental damage.
--
--	http://wiki.ffxiclopedia.org/wiki/Dia
--	Actually lowers defense by 26/512 and does an initial damage of 2?
--
--	Needs more detailed calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate initial damage.
	final = math.floor(2*getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100);
	
	--Calculate duration.
	duration = 30;
	
	--Check for Bio.
	bio = target:getStatusEffect(EFFECT_BIO);
	
	--Do it!
	if (DIA_OVERWRITE == 0 or (DIA_OVERWRITE == 1 and bio == nil)) then
		target:addStatusEffect(EFFECT_DIA,1,3,duration,FLAG_ERASABLE);
	else
		--print("Could not add effect due to existing Bio.");
	end
	final = takeMagicalDamage(caster,target,final);
	spell:setMsg(2);
	
	--Try to kill same tier Bio (optional)
	if (BIO_OVERWRITE == 1 and bio ~= nil) then
		if (bio:getPower() == 1) then
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