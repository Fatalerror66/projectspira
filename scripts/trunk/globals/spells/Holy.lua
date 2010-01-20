--------------------------------------
--	Author: Tenjou
-- 	Holy
-- 	Deals light elemental damage to an enemy.
--	
--	Credit to ffxiclopedia for listing the formula.
--	See the article: http://wiki.ffxiclopedia.org/wiki/Calculating_Magic_Damage
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
MND = caster:getStat(6);
RES = target:getStat(6);
 

--Calculate base damage.
base = 600; --Reasonable to assume this based on the other Light-element spells.
m = 2.0;
dMND = (MND - RES);
--print("dMND:",dMND);
d = base;
if (dMND < 0) then
	d = (base + dMND);
elseif (dMND >= 0) then
	d = (base + (dMND*m));
--elseif (dMND > c) then
--	d = (base + ((m*c) + (dMND-c) * m / 2));
--elseif (dMND > cap) then
--	d = cap;
end

final = MagicDamage(caster, target, spell, d, dMND, false) 

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