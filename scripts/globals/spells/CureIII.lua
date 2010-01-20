--------------------------------------
--	Author: Tenjou
-- 	Cure III
-- 	Restores target's HP.
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
Healing = caster:getSkill(HEALING_MAGIC_SKILL);

power = ((3*MND) + (VIT) + (3*math.floor(Healing/5)));
--print("MIND:",MND);
--print("VIT:",VIT);
--print("POWER:",power);

--Rate and Constant are based on which soft caps have been overcome by the caster.
rate = 1;
constant = 70;
if (power > 300) then
	rate = 15.6666;
	constant = 180.43;
elseif (power > 180) then
	rate = 2;
	constant = 115;
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
if (final < 130) then
	final = 130;
end;

if (caster:getStatusEffect(EFFECT_AFFLATUS_SOLACE) ~= nil) and (target:getStatusEffect(EFFECT_STONESKIN) == nil) then
  Afflatus_Stoneskin = math.floor(final/4);
  if (Afflatus_Stoneskin > 300) then
	  Afflatus_Stoneskin = 300;
  end;
  --print("Additional effect on target: Stoneskin");
  target:addStatusEffect(EFFECT_STONESKIN,Afflatus_Stoneskin,0,25);
end;

--Check to see if the target doesn't need that much healing.
maxhp = target:getMaxHP();
hp = target:getHP();
diff = (maxhp - hp);
mobfinal = final;
if (final > diff) then
	final = diff;
end

--Truncate decimal amounts.
final = math.floor(final);
 
--Do it!
if (target:isPlayer() == 1) then
	final = heal(caster,target,final);
elseif (target:isMob() == 1) then
	harm = cureResist(target:getFamily());
	if (harm < 0) then
		spell:setMsg(2);
		if (mobfinal < 0) then
			mobfinal = mobfinal * -1;
		end
		target:removeHP(mobfinal);
		final = mobfinal;
	else
		final = 0;
		final = heal(caster,target,final);
	end
end

target:updateEnmity(caster,final*(240/((target:getMainLvl()/1.6)+10)),final*(40/((target:getMainLvl()/1.6)+10)));
return final;
end;