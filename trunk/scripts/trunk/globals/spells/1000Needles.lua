--------------------------------------
--	Author: Tenjou
-- 	1000 Needles
-- 	Shoots multiple needles at enemies within range.
--
--	See ffxiclopedia's article on blue magic damage here:
--	http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();

--Base
needles = 1000;

--Multiple target damage reduction.
numcheck = spell:getTargNum();
final = (math.floor(needles/numcheck))*BLUE_POWER;

--Do it!
final = takeMagicalDamage(caster,target,final);

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

return final;
end;