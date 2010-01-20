--------------------------------------
--	Author: Tenjou
-- 	Tractor
-- 	Drags a KO'd target toward you.
--
--	Simple enough.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
--print();
spell:setMsg(42);
target:sendTractorMenu(caster:getRot(),caster:getZPos(),caster:getYPos(),caster:getXPos());

final = 0;
return final;
end;