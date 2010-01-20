--------------------------------------
--	Author: Tenjou
-- 	Sneak
-- 	Lessens chance of being detected by sound.
--
--	Needs better duration calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	target:updateEnmity(caster,1,1);
	target:addStatusEffect(EFFECT_SNEAK,1,0,60);
	final = EFFECT_SNEAK;
	return final;
end;