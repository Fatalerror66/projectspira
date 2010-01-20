--------------------------------------
--	Author: Tenjou
-- 	Maelstrom
-- 	Deals water damage to enemies within range..  Additional effect: STR Down.
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
MND = caster:getStat(6);
RES = target:getStat(5);
--print(INT,RES);

--Calculate base daage.
d = level+2;
alpha = getAlpha(level);
ST = (((INT*0.3)+(MND*0.1))*alpha);
m = 2.375;
CB = 1.00; --Convergence Bonus
dINT = (INT - RES);
--print("dINT:",dINT);
TM = 1.50; --Tier Multiplier
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

--Adjust message for multiple targets.
if (spell:getCurrTargNum() == 1) then
	spell:setMsg(2);
else
	spell:setMsg(264);
end

--Still missing a few BLU related things, such as the additional effect.

--Do it!
final = takeMagicalDamage(caster,target,final);

return final;
end;