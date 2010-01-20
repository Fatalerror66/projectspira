--------------------------------------
--	Author: Tenjou
-- 	Blood Saber
-- 	Steals HP from enemies within range.  Ineffective against undead.
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
blue = caster:getSkill(43);
macc = 50; --Reasonable to assume the base is 50%.

--Calculate base damage.
base = math.floor((math.floor((blue+1)*0.11))*3.5);

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


--Adjust bonus for staff.
staff = StaffBonus(caster, spell);

--Resistance
resist = spellResist(caster,target,spell,dINT,staff);
--print("RESIST:",resist);

day = spellDayWeatherBonus(caster, spell, false);

--print("Total day/weather bonus:",day);

--Without parties, magic burst adjustments cannot be implemented.
mb = 1.0;

final = base*resist*staff*day*mb*DRAIN_POWER;
if (final < 0) then final = 0; end

--Lower the amount drained if the mob does not have enough HP.
hp = target:getHP();
--print("HP:",hp);
if (hp < final) then
	final = hp;
end

--Do it!
final = takeMagicalDamage(caster,target,final);
caster:addHP(final);

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

return final;
end;