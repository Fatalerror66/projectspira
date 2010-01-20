--------------------------------------
--	Author: Tenjou
-- 	Regen
-- 	Gradually restores target's HP.
--
--	http://wiki.ffxiclopedia.org/wiki/Regen
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate amount to heal per tic.
	hp = 5;
	
	--Cleric's Briault enhances the effect.
	body = caster:getEquip(6);
	if (body == 0x3a86 or body == 0x3af1) then
		hp = hp+1;
	end
	
	--Calculate duration
	duration = 75;
	
	--Scale down duration based on level.
	if (target:getMainLvl() < 21) then
		duration = duration * target:getMainLvl() / 21;
	end
	
	--Try to erase same level regen.
	regen = target:getStatusEffect(EFFECT_REGEN);
	if (regen ~= nil and regen:getPower() <= hp) then
		target:removeStatusType(EFFECT_REGEN);
	end
	
	--Check for a higher level regen.
	if (regen ~= nil and regen:getPower() > hp) then
		spell:setMsg(75);
	else
		--Do it!
		target:addStatusEffect(EFFECT_REGEN,hp,3,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	end
	
	target:updateEnmity(caster,300,1);
	final = EFFECT_REGEN;
	return final;
end;