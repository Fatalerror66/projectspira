--------------------------------------
--	Author: Tenjou
-- 	Deodorize
-- 	Lessens chance of being detected by smell.
--
--	Needs better duration calculations.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	target:updateEnmity(caster,1,1);
	target:addStatusEffect(EFFECT_DEODORIZE,1,0,60);
	final = EFFECT_DEODORIZE;
	return final;
end;