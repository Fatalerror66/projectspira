--------------------------------------
--	Author: Tenjou
-- 	Raise II
-- 	Revives target from KO.
--
--	Also hardcoded to restore 50% of lost exp if accepted.
--	Players level 51 and above will get 75% of their lost exp back.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
spell:setMsg(42);
target:sendRaiseMenu(2);

final = 1;
return final;
end;