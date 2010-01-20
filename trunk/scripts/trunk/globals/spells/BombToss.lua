--------------------------------------
--	Author: Tenjou
-- 	Bomb Toss
-- 	Throws a bomb at an enemy.
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
level = caster:getMainLvl();
INT = caster:getStat(5);
RES = target:getStat(5);
--print(INT,RES);

--Calculate base daage.
d = level+2;
c = 40;
if (d > c) then d = c; end
alpha = getAlpha(level);
ST = ((INT*0.2)*alpha);
m = 1.625;
CB = 1.00; --Convergence Bonus
dINT = (INT - RES);
--print("dINT:",dINT);
TM = 1.00; --Tier Multiplier
INTbonus = dINT*TM;
dmg = (((d+ST)*m*CB)+(INTbonus));

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

--Will need to adjust damage for MAB and enemy MDB.
ratio = getMabMdbRatio(caster,target);

--Will need to adjust damage for natural mob resistance and weakness, such as in Ahrimans or Demons.
natural = getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100;

final = dmg*num*resist*staff*day*mb*ratio*natural*BLUE_POWER;
if (final < 0) then final = 0; end

--Still missing a few BLU related things, such as the additional effect.

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