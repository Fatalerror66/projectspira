--------------------------------------
--	Author: Tenjou
-- 	Eyes On Me
-- 	Deals dark damage to an enemy.
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
CHR = caster:getStat(7);
RES = target:getStat(7);
--print(CHR,RES);

--Calculate base daage.
d = level+2;
alpha = getAlpha(level);
ST = ((CHR*0.2)*alpha);
m = 2.625;
CB = 1.00; --Convergence Bonus
dCHR = (CHR - RES);
--print("dCHR:",dCHR);
TM = 1.50; --Tier Multiplier
CHRbonus = dCHR*TM;
dmg = (((d+ST)*m*CB)+(CHRbonus));

--Resistance
resist = spellResist(caster,target,spell,dCHR);
--print("RESIST:",resist);

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

return final;
end;