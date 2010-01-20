--------------------------------------
--	Author: Tenjou
-- 	Curaga
-- 	Restores HP for party members within area of effect.
--	The formula for Cure spells seems to be ((Power/2)/Rate) + Constant, where Power = (3*MND) + VIT + (3*Skill/5).
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
Healing = caster:getSkill(HEALING_MAGIC_SKILL);

power = ((3*MND) + (VIT) + (3*math.floor(Healing/5)));
--print("MIND:",MND);
--print("VIT:",VIT);
--print("POWER:",power);

--Rate and Constant are based on which soft caps have been overcome by the caster.
rate = 1;
constant = 45;
if (power > 250) then
	rate = 25.6666;
	constant = 134.025;
elseif (power > 150) then
	rate = 2;
	constant = 81.25;
end

--Amount to cure the target with.
cure = (math.floor(power/2))/(rate) + constant;
--print("CURE:",cure);

--Adjust bonus for staff.
staff = StaffBonus(caster, spell);


--Check for cure potency equipment.
potency = curePotency(caster);

day = spellDayWeatherBonus(caster, spell, false);
--print("Total day/weather bonus:",day);

--Final amount to heal the target with.
final = cure*staff*day*(1+potency)*CURE_POWER;
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

--Adjust message for multiple targets.
numcheck = spell:getCurrTargNum();
if (numcheck == 1) then
	spell:setMsg(7);
else
	spell:setMsg(24);
end

--Do it!
final = heal(caster,target,final);

target:updateEnmity(caster,100,50); --Inaccurate, only spell not based on number of targets.
return final;
end;