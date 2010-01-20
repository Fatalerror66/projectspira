---------------------------------------------
--	Author: ReaperX
-- 	Frost
--  Deals ice damage that lowers an enemy's agility and gradually reduces its HP. 
---------------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	if (target:getStatusEffect(EFFECT_BURN) ~= nil) then
		spell:setMsg(75); -- no effect
	else		
		staff = StaffBonus(caster, spell);
		dINT = caster:getStat(5)-target:getStat(5);
		resist = spellResist(caster,target,spell,dINT,staff);
		if (resist <= 0.125) then
			spell:setMsg(85);
		else
			if (target:getStatusEffect(EFFECT_CHOKE) ~= nil) then
				target:removeStatusType(EFFECT_CHOKE);
			end;
			INT = caster:getStat(5);
			DOT = getElementalDebuffDOT(INT);
			effect = target:getStatusEffect(EFFECT_FROST);
			noeffect = false;
			if (effect ~= nil) then
				if (effect:getPower() >= DOT) then
					noeffect = true;
				end;
			end;
			if (noeffect) then
				spell:setMsg(75); -- no effect
			else
				if (effect ~=nil) then
					target:removeStatusType(EFFECT_FROST);
				end;
				spell:setMsg(230);
				duration = math.floor(ELEMENTAL_DEBUFF_DURATION*resist);
				target:updateEnmity(caster,300,1);
				target:addStatusEffect(EFFECT_FROST,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASBLE);
			end;
		end;
	end;
	return EFFECT_FROST;
end;