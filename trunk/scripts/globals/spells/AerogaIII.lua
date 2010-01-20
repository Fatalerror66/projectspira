--------------------------------------
--	Author: Tenjou
-- 	Aeroga III
-- 	Deals wind damage to enemies within area of effect.
--	
--	Credit to ffxiclopedia for listing the formula.
--	See the article: http://wiki.ffxiclopedia.org/wiki/
--
--	For a more detailed discussion on resists and magic accuracy, please see this page:
--	http://robonosto.blogspot.com/2008/12/on-magic-resist-rates.html
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Pull relevant stats.
INT = caster:getStat(5);
RES = target:getStat(5);


--Calculate base damage.
base = 527;
m = 1.5;
dINT = (INT - RES);
--print("dINT:",dINT);
d = base;
if (dINT < 0) then
	d = (base + dINT);
elseif (dINT >= 0) then
	d = (base + (dINT*m));
--elseif (dINT > c) then
--	d = (base + ((m*c) + (dINT-c) * m / 2));
--elseif (dINT > cap) then
--	d = cap;
end

--Multiple target damage reduction.
num = 1.0;
numcheck = spell:getTargNum();
--print("There are " .. numcheck .. " targets.");
if (numcheck > 1 and numcheck < 10) then
	num = (0.9 - (0.05*numcheck));
	--print("Damage reduced by a factor of " .. num ..".");
elseif (numcheck >= 10) then
	num = 0.4;
	--print("Damage reduced by a factor of " .. num .."!");
end


final = MagicDamage(caster, target, spell, d, dINT, false) 

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

--Do it!
final = takeMagicalDamage(caster,target,final);
return final;
end;