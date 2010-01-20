--------------------------------------
--	Author: ReaperX
-- 	Absorb-AGI
-- 	Steals an enemy's agility.
--  Bugs: spell message currently says that target gains the effect of AGI Down
--  rather than caster gains the effect of AGI boost.
--  see also my note in StatusEffectsNotes.txt.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	if (target:getStatusEffect(EFFECT_AGI_DOWN) ~= nil) or (caster:getStatusEffect(EFFECT_AGI_UP) ~=nil) then
		spell:setMsg(75); -- no effect
	else		
		staff = StaffBonus(caster, spell);
		dINT = caster:getStat(5)-target:getStat(5);
		resist = spellResist(caster,target,spell,dINT,staff);
		if (resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(332);
			target:updateEnmity(caster,640,1);
			caster:addStatusEffect(EFFECT_AGI_UP,  ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains AGI
			target:addStatusEffect(EFFECT_AGI_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses AGI
		end
	end
	return EFFECT_AGI_DOWN;
end;