--------------------------------------
--	Author: Tenjou
-- 	Warp
-- 	Transports player to their home point.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();

if (target:getZone() ~= 0x83) then
	target:warp();
end

final = 0;
return final;
end;