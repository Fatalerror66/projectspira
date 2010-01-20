--------------------------------------
--	Author: Tenjou
-- 	Dia II
-- 	Lowers an enemy's defense and gradually deals light elemental damage.
--
--	http://wiki.ffxiclopedia.org/wiki/Dia_II
--	Actually lowers defense by 53/512 and does an initial damage of 8?
--
--	Needs more detailed calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate initial damage.
	final = math.floor(8*getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100);
	
	--Calculate duration.
	duration = 30;
	
	--Check for Bio.
	bio = target:getStatusEffect(EFFECT_BIO);
	
	--Do it!
	if (bio == nil or (DIA_OVERWRITE == 0 and bio:getPower() <= 2) or (DIA_OVERWRITE == 1 and bio:getPower() < 2)) then
		target:addStatusEffect(EFFECT_DIA,2,3,duration,FLAG_ERASABLE);
	else
		--print("Could not add effect due to existing Bio.");
	end
	final = takeMagicalDamage(caster,target,final);
	spell:setMsg(2);
	
	--Try to kill same tier Bio (optional)
	if (BIO_OVERWRITE == 1 and bio ~= nil) then
		if (bio:getPower() <= 2) then
			target:removeStatusType(EFFECT_BIO);
		end
	end
	
	return final;
end;