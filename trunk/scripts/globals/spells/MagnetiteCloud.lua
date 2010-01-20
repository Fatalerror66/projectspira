--------------------------------------
--	Author: Tenjou
-- 	Magnetite Cloud
-- 	Deals earth damage to enemies within a fan-shaped area originating from the caster.  Additional effect: Weight.
--
--	See ffxiclopedia's article on blue magic damage here:
--	http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Pull relevant stats.
hp = caster:getHP();
level = caster:getMainLvl();

--Calculate base damage.
D = math.floor(level/1.875);
hpp = math.floor(hp/6);
base = (D+hpp);

--Multiple target damage reduction.  It seems to be 1/(2^n) based on angle.
num = 1.0;
numcheck = spell:getTargNum();
--print("There are " .. numcheck .. " targets.");
num = 1/(2^numcheck);
--print("Damage reduced by a factor of " .. num ..".");

--Resistance.
resist = spellResist(caster,target,spell,0);

--Possible staff, day, weather, mob family, etc.  Additional effects missing.

final = (base*num*resist)*BLUE_POWER;

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