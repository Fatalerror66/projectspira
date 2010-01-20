--------------------------------------
--	Author: ReaperX (using Tenjou's code as a template)
-- 	Ionohelix
-- 	Deals thunder damage to an enemy, instantly and over time.
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
INT = caster:getStat(5);
RES = target:getStat(5);


--Calculate base damage.
base = 25;
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


final = MagicDamage(caster, target, spell, d, dINT, true) 

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

--Do it!
final = takeMagicalDamage(caster,target,final);

duration = getHelixDuration(caster, target, spell);

-- missing: duration resist

target:addStatusEffect(EFFECT_HELIX,final,10,duration);

return final;
end;