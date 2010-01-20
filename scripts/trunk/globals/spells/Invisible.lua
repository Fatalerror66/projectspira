--------------------------------------
--	Author: Tenjou
-- 	Invisible
-- 	Lessens chance of being detected by sight.
--
--	Needs better duration calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	target:updateEnmity(caster,1,1);
	target:addStatusEffect(EFFECT_INVISIBLE,1,0,60);
	final = EFFECT_INVISIBLE;
	return final;
end;