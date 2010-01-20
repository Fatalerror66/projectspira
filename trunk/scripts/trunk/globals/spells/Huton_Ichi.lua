--------------------------------------
--	Author: Tenjou
-- 	Huton: Ichi
-- 	Deals wind damage to an enemy and lowers its resistance against ice.
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
base = 10;
m = 1.0;
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

--Doesn't actually lower resistance yet.

--Check for item.
tool = caster:hasItem(ITEM_KAWAHORI_OGI,0);
if (tool ~= 0 and tool ~= nil) then
	caster:removeItem(tool,1);
else
	final = 0; --Temporary solution.
end
caster:addItem(0);

--Do it!
final = takeMagicalDamage(caster,target,final);
return final;
end;