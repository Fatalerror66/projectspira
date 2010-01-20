--------------------------------------
--	Author: Tenjou
-- 	Death
-- 	Instantly kills any target.
--
--	Player's cannot normally use this spell.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
--print();
--Do it   >=)
target:setHP(0);
return 0;
end;