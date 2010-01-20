--------------------------------------
--	Author: ReaperX
-- 	Absorb-DEX
-- 	Steals an enemy's dexterity.
--  Bugs: spell message currently says that target gains the effect of DEX Down
--  rather than caster gains the effect of DEX boost.
--  see also my note in StatusEffectsNotes.txt.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	if (target:getStatusEffect(EFFECT_DEX_DOWN) ~= nil) or (caster:getStatusEffect(EFFECT_DEX_UP) ~=nil) then
		spell:setMsg(75); -- no effect
  else		
	  staff = StaffBonus(caster, spell);
	  dINT = caster:getStat(5)-target:getStat(5);
	  resist = spellResist(caster,target,spell,dINT,staff);
	  if (resist <= 0.125) then
		  spell:setMsg(85);
	  else
	    spell:setMsg(330);
	    target:updateEnmity(caster,640,1);
	    caster:addStatusEffect(EFFECT_DEX_UP,  ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains DEX
	    target:addStatusEffect(EFFECT_DEX_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses DEX
	  end;
    return EFFECT_DEX_DOWN;
  end;
end;