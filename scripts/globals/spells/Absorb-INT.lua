--------------------------------------
--	Author: ReaperX
-- 	Absorb-INT
-- 	Steals an enemy's intelligence.
--  Bugs: spell message currently says that target gains the effect of INT Down
--  rather than caster gains the effect of INT boost.
--  see also my note in StatusEffectsNotes.txt.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	if (target:getStatusEffect(EFFECT_INT_DOWN) ~= nil) or (caster:getStatusEffect(EFFECT_INT_UP) ~=nil) then
		spell:setMsg(75); -- no effect
  else		
	  staff = StaffBonus(caster, spell);
	  dINT = caster:getStat(5)-target:getStat(5);
	  resist = spellResist(caster,target,spell,dINT,staff);
	  if (resist <= 0.125) then
		  spell:setMsg(85);
	  else
	    spell:setMsg(333);
	    target:updateEnmity(caster,640,1);
	    caster:addStatusEffect(EFFECT_INT_UP,  ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains INT
	    target:addStatusEffect(EFFECT_INT_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses INT
	  end;
    return EFFECT_INT_DOWN;
  end;
end;