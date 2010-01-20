--------------------------------------
--	Author: Tenjou
-- 	Name of Spell
-- 	Description of spell.  Usually the same as the help text in-game.
--
--	Some comments about the source of any formulas you may find.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	target:updateEnmity(caster,1,1);
	final = 0;
	return final;
end;