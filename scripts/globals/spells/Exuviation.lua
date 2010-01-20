--------------------------------------
--	Author: Tenjou
-- 	Exuviation
-- 	Restores target's HP and removes one detrimental magic effect.
--
--	Credit to Furen for his hard work in finding the formula for all WHM and BLU healing spells.
--	See his work here: http://members.shaw.ca/pizza_steve/cure/Index.html
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Pull base stats from caster.
MND = caster:getStat(6);
VIT = caster:getStat(3);
--There is no healing skill yet.  I've commented out the skill getter function, which is also not in yet.
blue = caster:getSkill(43);
power = ((3*MND) + (VIT) + (3*math.floor(blue/5)));
--print("MIND:",MND);
--print("VIT:",VIT);
--print("POWER:",power);

--Rate and Constant are based on which soft caps have been overcome by the caster.
rate = 1;
constant = 0;
if (power > 100) then
	rate = 57;
	constant = 29.125;
elseif (power > 60) then
	rate = 2;
	constant = 5;
end

--Amount to cure the target with.
cure = (math.floor(power/2))/(rate) + constant;
--print("CURE:",cure);

--Adjust bonus for staff.
staff = StaffBonus(caster, spell);

--Check for cure potency equipment.
potency = curePotency(caster);

day = spellDayWeatherBonus(caster, spell, true, false);

--print("Total day/weather bonus:",day);

--Final amount to heal the target with.
final = cure*staff*day*CURE_POWER;

--Adjust for Blue Magic.
final = (final + 50);

--Raise the amount above the minimum hard cap.
if (final < 60) then
	final = 60;
end;

--Check to see if the target doesn't need that much healing.
maxhp = target:getMaxHP();
hp = target:getHP();
diff = (maxhp - hp);
if (final > diff) then
	final = diff;
end

--Truncate decimal amounts.
final = math.floor(final);

--Do it!
final = heal(caster,target,final);

--Also erase.
target:erase();

return final;
end;