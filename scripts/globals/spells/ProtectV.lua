--------------------------------------
--	Author: Tenjou
-- 	Protect V
--	Enhances target's defense.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	--Calculate defense.  Although this isn't available to players, it should match Protectra V in that it can be enhanced through WHM merits.
	defense = 60;
	
	--Calculate duration
	duration = 1800;
	
	--Scale down duration based on level.
	if (target:getMainLvl() < 75) then
		duration = duration * target:getMainLvl() / 75;
	end
	
	--Try to erase same level protect.
	protect = target:getStatusEffect(EFFECT_PROTECT);
	if (protect ~= nil and protect:getPower() <= defense) then
		target:removeStatusType(EFFECT_PROTECT);
	end
	
	--Check for a higher level protect.
	if (protect ~= nil and protect:getPower() > defense) then
		spell:setMsg(75);
	else
		--Do it!
		target:addStatusEffect(EFFECT_PROTECT,defense,0,duration,FLAG_DISPELABLE);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	end
	
	target:updateEnmity(caster,80,1);
	final = EFFECT_PROTECT;
	return final;
end;