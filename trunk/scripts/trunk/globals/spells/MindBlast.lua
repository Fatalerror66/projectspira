--------------------------------------
--	Author: Tenjou
-- 	Mind Blast
-- 	Deals lightning damage to an enemy.  Additional effect: Paralysis.
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
MND = caster:getStat(6);
RES = target:getStat(6);
--print(MND,RES);

--Calculate base daage.
d = level+2;
alpha = getAlpha(level);
ST = ((MND*0.3)*alpha);
m = (531/256);
CB = 1.00; --Convergence Bonus
dMND = (MND - RES);
--print("dMND:",dMND);
TM = 1.50; --Tier Multiplier
MNDbonus = dMND*TM;
dmg = (((d+ST)*m*CB)+(MNDbonus));

--Resistance
resist = spellResist(caster,target,spell,dMND);
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