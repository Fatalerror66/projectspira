--------------------------------------
--	Author: Tenjou
-- 	Recall-Meriph
-- 	Teleports qualified party members within area of effect to Meriphataud Mountains [S].
--
--	Although the basic function is accurate, it still appears very buggy.  Will most likely crash those without the expansion.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Check for Jugner Gate Crystal.
meriph = target:hasKeyItem(0x3c5);
if (meriph == 1) then
	zone = caster:getZone();
	if (zone ~= 0x83) then
		target:setPos(306,-14,25,0xc0,0x61);
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
