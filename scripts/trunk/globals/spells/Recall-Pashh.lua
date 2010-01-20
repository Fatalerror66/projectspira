--------------------------------------
--	Author: Tenjou
-- 	Recall-Pashh
-- 	Teleports qualified party members within area of effect to Pashhow Marsh [S].
--
--	Although the basic function is accurate, it still appears very buggy.  Will most likely crash those without the expansion.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Check for Jugner Gate Crystal.
pashh = target:hasKeyItem(0x3c4);
if (pashh == 1) then
	zone = caster:getZone();
	if (zone ~= 0x83) then
		target:setPos(340,25,-115,0x40,0x5a);
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
