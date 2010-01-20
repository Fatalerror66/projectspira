--------------------------------------
--	Author: Tenjou
-- 	Teleport-Altep
-- 	Teleports qualified party members within area of effect to Altep.
--
--	Although the basic function is accurate, it still appears very buggy.  Will most likely crash those without the expansion.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

function OnSpellCast(caster,target,spell)
--print();
--Check for Altep Gate Crystal.
altep = target:hasKeyItem(0x165);
if (altep == 1) then
	zone = caster:getZone();
	if (zone ~= 0x83) then
		toAltep(target);
	else
		--Secret Surprise
		target:setHP(1);
		target:setMP(0);
		target:setPos(260,12,230,0x40,0x83);
		--print("LOL DENIED!!!");
	end
end


final = 0;
return final;
end;