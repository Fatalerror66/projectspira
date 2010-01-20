--------------------------------------
--	Author: Tenjou
-- 	Magic Hammer
-- 	Steals an amount of enemy's MP equal to damage dealt.  Ineffective against undead.
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
c = 35;
if (d > c) then d = c; end
alpha = getAlpha(level);
ST = ((MND*0.3)*alpha);
m = 1.00;
CB = 1.00; --Convergence Bonus
dMND = (MND - RES);
--print("dMND:",dMND);
TM = 1.00; --Tier Multiplier
MNDbonus = dMND*TM;
dmg = (((d+ST)*m*CB)+(MNDbonus));

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
target:removeMP(final);
caster:addMP(final);

return final;
end;