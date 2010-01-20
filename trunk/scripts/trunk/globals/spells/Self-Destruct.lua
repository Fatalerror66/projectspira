--------------------------------------
--	Author: Tenjou
-- 	Self-Destruct
-- 	Sacrifices HP to damage enemies within range.  Affects caster with Weakness.
--
--	The general consensus is that damage is based mostly on current HP.  What is for sure is that the caster's HP will be lowered to 1 and they will be weakened.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();

--Pull relevant stats.
hp = caster:getHP();
--print(hp);

final = ((hp-1)*2)*BLUE_POWER;

--Do it!
final = takeMagicalDamage(caster,target,final);
if (spell:getTargNum() == spell:getCurrTargNum()) then
	caster:setHP(1);
end
--caster:addStatus(1,300);

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

return final;
end;