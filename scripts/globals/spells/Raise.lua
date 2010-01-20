--------------------------------------
--	Author: Tenjou
-- 	Raise
-- 	Revives target from KO.
--
--	Also hardcoded to restore 50% of lost exp if accepted.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
spell:setMsg(42);
target:sendRaiseMenu(1);

final = 1;
return final;
end;