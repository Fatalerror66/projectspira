--------------------------------------
--	Author: Tenjou
-- 	Meteor
-- 	Deals darkness damage to enemies within area of effect.
--	
--	Credit to ffxiclopedia for listing the formula.
--	See the article: http://wiki.ffxiclopedia.org/wiki/Calculating_Magic_Damage
--
--	For a more detailed discussion on resists and magic accuracy, please see this page:
--	http://robonosto.blogspot.com/2008/12/on-magic-resist-rates.html
--
--
--
-- This spell cannot normally be used by players.
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
base = 9001;
m = 13.37;
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